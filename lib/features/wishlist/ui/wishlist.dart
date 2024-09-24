import 'package:blocsamp1/features/wishlist/bloc/wishlist_bloc_bloc.dart';
import 'package:blocsamp1/features/wishlist/ui/wishlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => WishlistState();
}
final WishlistBlocBloc wishlistbloc=WishlistBlocBloc();
class WishlistState extends State<Wishlist> {
@override
  void initState(){
  wishlistbloc.add(WishlistInitialEvent());
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(title: const Text('Wishlisted Items'),
centerTitle:  true,),
body: BlocConsumer<WishlistBlocBloc,WishlistBlocState>(
  bloc: wishlistbloc,
    listener: (context, state) {
          if(state is WishlistRemovedActionState){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wishlist Removed')));
          }
        },
    listenWhen: (previous, current) => current is WishlistActionState,
  buildWhen: (previous, current) => current is !WishlistActionState,
  builder: (context, state) {
    switch(state.runtimeType){
  case const (WishlistSuccessState):
  final succsusState=state as WishlistSuccessState;
  return ListView.builder(
    itemCount:succsusState.wishlistITems.length,
    itemBuilder: (context, index) {
      return WishlistTile(
        productdatamodel: succsusState.wishlistITems[index],
         wishlistbloc: wishlistbloc);
    },
    );
    
    }
    return const Center(child: CircularProgressIndicator());
  },
),
    );
  }
}
