import 'package:flutter/material.dart';

import 'package:new_ecommerce/widget/widget.dart';
class CataiogScreen extends StatelessWidget {
  static const String routeName='/cataiog';
  static Route route(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CataiogScreen(),
    );
  }
  const CataiogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      appBar:  CustomAppBar( title: 'Cataiog',),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
