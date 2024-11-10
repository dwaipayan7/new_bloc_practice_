import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc_practice/feature/home/ui/product_tile_widget.dart';
import 'package:new_bloc_practice/feature/wishlist/ui/wishlist_page.dart';

import '../../cart/ui/cart_page.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPage) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
        }
        if (state is HomeNavigateToWishlistPage) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishlistPage()));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is HomeLoadedSuccessState) {
          // final successState = state as HomeLoadedSuccessState;
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Grocery Store",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 4,
              backgroundColor: Colors.teal,
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(HomeProductWishlistButtonNavigateEvent());
                  },
                  icon:
                      Icon(Icons.favorite_border_outlined, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(HomeCartButtonNavigateEvent());
                  },
                  icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
                ),
              ],
            ),
            body: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                      productDataModel: state.products[index]);
                }),
          );
        }
        if (state is HomeErrorState) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
