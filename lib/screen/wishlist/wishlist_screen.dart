

import 'package:flutter/material.dart';
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
    return const  Scaffold(
      appBar:  CustomAppBar( title: 'Wishlist',),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
