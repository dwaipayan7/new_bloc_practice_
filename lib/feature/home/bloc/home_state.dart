part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}

class HomeLoadedSuccessState extends HomeState{

 final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});


}

class HomeLoadingState extends HomeState{}

class HomeErrorState extends HomeState{
  final String message;

  HomeErrorState({required this.message});
}

class HomeNavigateToWishlistPage extends HomeActionState{}

class HomeNavigateToCartPage extends HomeActionState{}



