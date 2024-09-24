import 'package:blocsamp1/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:blocsamp1/features/cart/ui/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

final CartBlocBloc cartbloc = CartBlocBloc();
class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    cartbloc.add(CartInitialEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cart items'),
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartbloc,
        listener: (context, state) {
          if(state is CartRemovedActionState){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cart Removed')));
          }
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        builder: (context, state) {
          switch(state.runtimeType){
            case const (CartSuccessState):
            final succesState=state as CartSuccessState;
            return ListView.builder(
                itemCount: succesState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTile(
                
                      productdatamodel: succesState.cartItems[index],cartbloc: cartbloc,);
                },
              );
          }
          return Container(

          );
        },
      ),
    );
  }
}
