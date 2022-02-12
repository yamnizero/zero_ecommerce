import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecommerce/screen/screens.dart';


class AppRouter{
  static Route onGenerateRoute(RouteSettings settings) {
    print('this is route : ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CataiogScreen.routeName:
        return CataiogScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar:  AppBar(title: const Text('Error'),),
      ),
    );
  }
}