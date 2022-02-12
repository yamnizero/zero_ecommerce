import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_ecommerce/models/models.dart';
import 'package:new_ecommerce/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Zero E-commerce',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: Category.categories
                .map((category) => HeroCarouselCard(category: category))
                .toList(),
          ),
          const SectionTitle(title: 'RECOMMENDED'),
           ProductCarousel(products:Product.products.where((product) => product.isRecommended).toList()),
          const SectionTitle(title: 'MOST POPULAR'),
          ProductCarousel(products:Product.products.where((product) => product.isPopular).toList()),
        ],
      ),
    );
  }
}



