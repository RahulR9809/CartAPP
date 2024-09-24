import 'package:blocsamp1/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:blocsamp1/features/cart/ui/cart.dart';
import 'package:blocsamp1/features/home/model/home_product_data_model.dart';
import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  final ProductDataModel productdatamodel;
  const CartTile(
      {super.key, required this.productdatamodel, required this.cartbloc});
  final CartBlocBloc cartbloc;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  
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
                      
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                  IconButton(
                      onPressed: () {
                     cartbloc.add(CartRmoveFromCartEvent(productdatamodel:widget.productdatamodel));
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
