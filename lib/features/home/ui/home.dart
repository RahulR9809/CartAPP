import 'package:blocsamp1/features/cart/ui/cart.dart';
import 'package:blocsamp1/features/home/bloc/home_bloc_bloc.dart';
import 'package:blocsamp1/features/home/ui/product_tile_widget.dart';
import 'package:blocsamp1/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    homebloc.add(HomeInitialEvent());
  }

  final HomeBlocBloc homebloc = HomeBlocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigationToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Wishlist()));
        }
        else if(state is HomeproductItemproductwishlistActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('item wishlisted')));
        }
        else if(state is HomeproductItemproductcartActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('item carted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case const (HomeLoadedSuccessState):
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                centerTitle: true,
                title: const Text('Grocery app'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(
                        Icons.shopping_bag,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ))
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                      productdatamodel: successState.products[index], homebloc: homebloc,);
                },
              ),
            );
          case const (HomeErrorState):
            return const Scaffold(body: Center(child: Text('error')));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
