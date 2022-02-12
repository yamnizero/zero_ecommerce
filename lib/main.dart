import 'package:flutter/material.dart';
import 'config/app_router.dart';
import 'config/theme.dart';
import 'screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zero E-commerce',
      theme: theme(),

      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,

    );
  }
}
