import 'package:blocsamp1/features/home/model/home_product_data_model.dart';
import 'package:blocsamp1/features/wishlist/bloc/wishlist_bloc_bloc.dart';
import 'package:blocsamp1/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';

class WishlistTile extends StatefulWidget {
  final ProductDataModel productdatamodel;
  const WishlistTile(
      {super.key, required this.productdatamodel, required this.wishlistbloc});
  final WishlistBlocBloc wishlistbloc;

  @override
  State<WishlistTile> createState() => _WishlistTileState();
}

class _WishlistTileState extends State<WishlistTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.productdatamodel.imageUrl))),
          ),
          const SizedBox(height: 20),
          Text(
            widget.productdatamodel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.productdatamodel.description,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // ignore: prefer_interpolation_to_compose_strings
                "\$" + widget.productdatamodel.price.toString(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                       wishlistbloc.add(WishlistRemoveFromEvent(productDataModel: widget.productdatamodel));
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                  IconButton(
                      onPressed: () {
                        // homebloc.add(HomeproductCartButtonClickedEvent(
                        //     clickedprouct: productdatamodel));
                      },
                      icon: const Icon(
                        Icons.shopping_bag,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
