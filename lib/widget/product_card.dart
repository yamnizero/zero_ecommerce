import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ecommerce/blocs/cart/cart_bloc.dart';
import 'package:new_ecommerce/blocs/cart/cart_event.dart';
import 'package:new_ecommerce/blocs/cart/cart_state.dart';
import 'package:new_ecommerce/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;
  const ProductCard({
    Key? key, required this.product,
    this.widthFactor =2.5,
    this.leftPosition=5,
    this.isWishlist =false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthvale =MediaQuery.of(context).size.width /widthFactor;
    return InkWell(
      onTap: ()
      {
        Navigator.pushNamed(context, '/product',arguments: product);
      },
      child: Stack(
        children: [
          SizedBox(
            width:widthvale,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: widthvale - 5 - leftPosition ,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width:widthvale - 15 - leftPosition,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            ' \$${Product.products[0].price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc,CartState>(
                      builder: (context,state) {
                        if(state is CartLoading){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if(state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                              icon: const Icon(
                                Icons.add_circle, color: Colors.white,),
                              onPressed: () {
                                context.read<CartBloc>().add(AddProduct(product));
                              },
                            ),
                          );
                        }
                        else {return  const Text('Something went wrong');}
                      }
                    ),
                    isWishlist ?
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.delete,color: Colors.white,),
                        onPressed: (){},
                      ),
                    ): const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}