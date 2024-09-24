part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

abstract class HomeActionState extends HomeBlocState{}

final class HomeBlocInitial extends HomeBlocState {}

//home state for building the ui
 class HomeLoadingState extends HomeBlocState{}

 class HomeLoadedSuccessState extends HomeBlocState{
  late final List<ProductDataModel>products;
  HomeLoadedSuccessState({
    required this.products
  });
 }

 class HomeErrorState extends HomeBlocState{}

  //Action sate it is for performing an action 

 class HomeNavigateToWishlistPageActionState extends HomeActionState{}

 class HomeNavigationToCartPageActionState extends HomeActionState{}


 class HomeproductItemproductwishlistActionState extends HomeActionState{}


 class HomeproductItemproductcartActionState extends HomeActionState{}
