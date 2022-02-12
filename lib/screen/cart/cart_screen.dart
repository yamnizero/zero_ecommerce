
import 'package:flutter/material.dart';

import 'package:new_ecommerce/widget/widget.dart';


class CartScreen extends StatelessWidget {
  static const String routeName='/cart';
  static Route route(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      appBar:  CustomAppBar( title: 'Cart',),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
