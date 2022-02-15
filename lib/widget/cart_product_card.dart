
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ecommerce/blocs/cart/cart_bloc.dart';
import 'package:new_ecommerce/blocs/cart/cart_event.dart';
import 'package:new_ecommerce/blocs/cart/cart_state.dart';
import 'package:new_ecommerce/models/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;

  const CartProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100.0,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,style: Theme.of(context).textTheme.headline5,),
                Text('\$${product.price}',style: Theme.of(context).textTheme.headline6,),
              ],
            ),
          ),
          const SizedBox(width: 10.0,),
          BlocBuilder<CartBloc,CartState>(
            builder:(context ,state) {
              return Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      context.read<CartBloc>().add(RemoveProduct(product));
                    },
                  ),
                  Text('1', style: Theme
                      .of(context)
                      .textTheme
                      .headline5,),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      context.read<CartBloc>().add(AddProduct(product));
                    },
                  ),
                ],
              );
            }
          )
        ],
      ),
    );
  }
}