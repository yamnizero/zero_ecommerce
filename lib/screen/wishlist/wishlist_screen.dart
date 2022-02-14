

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:new_ecommerce/blocs/wishlist/wishlist_state.dart';
import 'package:new_ecommerce/models/models.dart';
import 'package:new_ecommerce/widget/widget.dart';




class WishlistScreen extends StatelessWidget {
  static const String routeName='/wishlist';
  static Route route(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WishlistScreen(),
    );
  }
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:  CustomAppBar( title: 'Wishlist',),
      bottomNavigationBar:  CustomNavBar(),


      body: BlocBuilder<WishlistBloc,WishlistState>(

        builder:(context,state) {
          if(state is WishlistLoading){
            return  const Center(child: CircularProgressIndicator(),);
          }
          if (state is WishlistLoaded){
            return  GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 2.4),
              itemCount:state.wishlist.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: ProductCard(
                    product: state.wishlist.products[index],
                    widthFactor:1.1,
                    leftPosition: 100,
                    isWishlist: true,
                  ),
                );
              },
            );
          }
          else {return const Text('Something went wrong ');}
        },
      ),
    );
  }
}
