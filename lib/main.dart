import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ecommerce/blocs/cart/cart_bloc.dart';
import 'package:new_ecommerce/blocs/cart/cart_event.dart';
import 'package:new_ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:new_ecommerce/blocs/wishlist/wishlist_event.dart';
import 'config/app_router.dart';
import 'config/theme.dart';
import 'observer.dart';
import 'screen/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
        () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CartBloc()..add(LoadCart())),
        BlocProvider(create: (_)=> WishlistBloc()..add(LoadWishlist())),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zero E-commerce',
        theme: theme(),

        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,

      ),
    );
  }
}
