import 'package:flutter/material.dart';
import 'package:new_ecommerce/models/models.dart';

import 'package:new_ecommerce/widget/widget.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;

  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> catagoryProducts =Product.products.where((product) => product.category == category.name).toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.15),
        itemCount: catagoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: ProductCard(
            product: catagoryProducts[index],
                widthFactor: 2.2,
          ),
          );
        },
      ),
    );
  }
}
