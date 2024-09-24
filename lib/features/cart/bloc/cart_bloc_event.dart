part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocEvent {}


class CartInitialEvent extends CartBlocEvent{

}

class CartRmoveFromCartEvent extends CartBlocEvent{
  final ProductDataModel productdatamodel;

  CartRmoveFromCartEvent({required this.productdatamodel});
}