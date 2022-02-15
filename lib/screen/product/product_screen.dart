import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ecommerce/blocs/cart/cart_bloc.dart';
import 'package:new_ecommerce/blocs/cart/cart_event.dart';
import 'package:new_ecommerce/blocs/cart/cart_state.dart';
import 'package:new_ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:new_ecommerce/blocs/wishlist/wishlist_event.dart';
import 'package:new_ecommerce/blocs/wishlist/wishlist_state.dart';
import 'package:new_ecommerce/models/models.dart';
import 'package:new_ecommerce/widget/widget.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(product: product),
    );
  }

  final Product product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              BlocBuilder<WishlistBloc,WishlistState>(
                builder: (context,state){
                 return IconButton(
                      icon:  const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.read<WishlistBloc>().add(AddProductToWishlist(product));

                        final  snackBar =    SnackBar(content: Text('Added to your Wishlist!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                  );
                }
              ),
              BlocBuilder<CartBloc,CartState>(
                builder:(context,state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      context.read<CartBloc>().add(AddProduct(product));
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Text(
                        'ADD TO CART',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline3
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [HeroCarouselCard(product: product)]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text('Product Information',
                  style: Theme.of(context).textTheme.headline3),
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,Proin eget malesuada velit. Donec auctor est sapien, luctus lobortis libero congue. Lorem ipsum dolor sit amet consectetur adipising elit. Proin eget malesuada velit.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text('Delivery Information',
                  style: Theme.of(context).textTheme.headline3),
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,Proin eget malesuada velit. Donec auctor est sapien, luctus lobortis libero congue. Lorem ipsum dolor sit amet consectetur adipising elit. Proin eget malesuada velit.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
