import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocsamp1/data/cart_items.dart';
import 'package:blocsamp1/features/home/model/home_product_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
        
        on<CartInitialEvent>(cartinitialevent);
        on<CartRmoveFromCartEvent>(cartRemoveEvent);
  }

  FutureOr<void> cartinitialevent(CartInitialEvent event,
   Emitter<CartBlocState> emit) {
    emit(CartSuccessState(cartItems: cartItem));
  }

  FutureOr<void> cartRemoveEvent(CartRmoveFromCartEvent event,
   Emitter<CartBlocState> emit) {
    cartItem.remove(event.productdatamodel);
    emit(CartSuccessState(cartItems: cartItem));
    emit(CartRemovedActionState());
  }
}
