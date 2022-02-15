import 'dart:async';

import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),() => Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Center(
            child: Image(image: AssetImage('assets/images/logoo.png'),
            width: 125,
              height: 125,
            ),
          ),
          SizedBox(height:30 ,),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Text('Ecommerce',
            style:Theme.of(context).textTheme. headline2!.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
