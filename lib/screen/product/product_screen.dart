
import 'package:flutter/material.dart';
import 'package:new_ecommerce/widget/widget.dart';



class ProductScreen extends StatelessWidget {
  static const String routeName='/product';
  static Route route(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProductScreen(),
    );
  }
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      appBar:  CustomAppBar( title: 'Product',),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
