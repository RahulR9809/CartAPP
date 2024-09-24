import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocsamp1/data/cart_items.dart';
import 'package:blocsamp1/data/grocery_data.dart';
import 'package:blocsamp1/data/wishlist_items.dart';
import 'package:blocsamp1/features/home/model/home_product_data_model.dart';
import 'package:flutter/foundation.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {

   on<HomeInitialEvent>(homeInitialEvent);

    on<HomeWishlistButtonNavigateEvent>(
      homeWishlistButtonNavigateEvent);

  on<HomeCartButtonNavigateEvent>(
    homeCartButtonNavigateEvent);

    on<HomeproductWishlistButtonClickedEvent>(
        homeproductWishlistButtonClickedEvent);

    on<HomeproductCartButtonClickedEvent>(
      homeproductCartButtonClickedEvent);
  }


///methods///   

 FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
     Emitter<HomeBlocState> emit)async {
      emit(HomeLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e)=>ProductDataModel(
        id: e['id'],
         name: e['name'],
          description: e['description'],
           price: e['price'],
            imageUrl: e['imageUrl']
            )).toList()));
  }

  FutureOr<void> homeproductWishlistButtonClickedEvent(
      HomeproductWishlistButtonClickedEvent event,
      Emitter<HomeBlocState> emit) {
    if (kDebugMode) {
      print('wishlist button clicked');
    }
    WishlistItem.add(event.clickedprouct);
    emit(HomeproductItemproductwishlistActionState());
  }

  FutureOr<void> homeproductCartButtonClickedEvent(
      HomeproductCartButtonClickedEvent event,
       Emitter<HomeBlocState> emit) {
    if (kDebugMode) {
      print('cart button clicked');
    }
    cartItem.add(event.clickedprouct);
    emit(HomeproductItemproductcartActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event,
       Emitter<HomeBlocState> emit) {
             if (kDebugMode) {
               print('wishlist navigate clicked');
             }
             emit(HomeNavigateToWishlistPageActionState());
      }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
     Emitter<HomeBlocState> emit) {
      if (kDebugMode) {
        print('cart navigate clicked');
      }
      emit(HomeNavigationToCartPageActionState());
  }

 
}
