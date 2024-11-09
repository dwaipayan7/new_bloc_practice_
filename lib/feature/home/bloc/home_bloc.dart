import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
   on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
   on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

   on<HomeProductWishlistButtonNavigateEvent>(homeProductWishlistButtonNavigateEvent);

   on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);

  }




  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {

    print("Wishlist Button Clicked");

  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart Button Clicked");
  }

  FutureOr<void> homeProductWishlistButtonNavigateEvent(HomeProductWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Wishlist Navigate Button Clicked");
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Navigate Button Clicked");

  }
}
