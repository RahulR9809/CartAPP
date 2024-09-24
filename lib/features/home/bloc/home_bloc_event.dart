part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeproductWishlistButtonClickedEvent extends HomeBlocEvent {
  final ProductDataModel clickedprouct;

  HomeproductWishlistButtonClickedEvent({required this.clickedprouct});
}

class HomeproductCartButtonClickedEvent extends HomeBlocEvent {
   final ProductDataModel clickedprouct;

  HomeproductCartButtonClickedEvent({required this.clickedprouct});
}

class HomeWishlistButtonNavigateEvent extends HomeBlocEvent {}

class HomeCartButtonNavigateEvent extends HomeBlocEvent {}
