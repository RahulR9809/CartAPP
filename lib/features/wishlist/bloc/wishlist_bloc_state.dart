part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocState {}

abstract class WishlistActionState extends WishlistBlocState{}
class WishlistRemovedActionState extends WishlistActionState{}

final class WishlistBlocInitial extends WishlistBlocState {}

class WishlistSuccessState extends WishlistBlocState{
final List<ProductDataModel>wishlistITems;

  WishlistSuccessState({required this.wishlistITems});
}