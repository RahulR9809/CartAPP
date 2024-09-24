import 'package:blocsamp1/features/home/bloc/home_bloc_bloc.dart';
import 'package:blocsamp1/features/home/model/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productdatamodel;
  const ProductTileWidget({super.key, required this.productdatamodel, required this.homebloc});
final HomeBlocBloc homebloc;
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
                    image: NetworkImage(productdatamodel.imageUrl))),
          ),
          const SizedBox(height: 20),
          Text(
            productdatamodel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            productdatamodel.description,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
               // ignore: prefer_interpolation_to_compose_strings
               "\$"+productdatamodel.price.toString(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                         ),

                         Row(children: [
                            IconButton(
                      onPressed: () {
                        homebloc.add(HomeproductWishlistButtonClickedEvent(clickedprouct: productdatamodel

                        ));
                      },
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeproductCartButtonClickedEvent(clickedprouct: productdatamodel

                        ));
                      },
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ))
                         ],)
             ],
           ),
         
        ],
      ),
    );
  }
}
