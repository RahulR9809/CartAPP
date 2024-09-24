import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocsamp1/data/wishlist_items.dart';
import 'package:blocsamp1/features/home/model/home_product_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
   
   on<WishlistInitialEvent>(wishlistinitialEvent);
on<WishlistRemoveFromEvent>(wishlistRemoveFromEvent);
  }

  FutureOr<void> wishlistinitialEvent(WishlistInitialEvent event, 
  Emitter<WishlistBlocState> emit) {
    emit(WishlistSuccessState(wishlistITems: WishlistItem));
  }

  FutureOr<void> wishlistRemoveFromEvent(WishlistRemoveFromEvent event,
   Emitter<WishlistBlocState> emit) {
    WishlistItem.remove(event.productDataModel);
    emit(WishlistSuccessState(wishlistITems: WishlistItem));
    emit(WishlistRemovedActionState());
  }
}
