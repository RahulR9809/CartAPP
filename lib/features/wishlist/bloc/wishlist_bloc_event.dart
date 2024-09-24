part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocEvent {}

class WishlistInitialEvent extends WishlistBlocEvent{}

class WishlistRemoveFromEvent extends WishlistBlocEvent{
  final ProductDataModel productDataModel;

  WishlistRemoveFromEvent({required this.productDataModel});
}

