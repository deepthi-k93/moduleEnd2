import 'package:flutter/material.dart';
import 'package:module2_end_assignment/providers/cart_provider.dart';
import 'package:module2_end_assignment/providers/products_provider.dart';
import 'package:module2_end_assignment/providers/wishlist_provider.dart';
import 'package:module2_end_assignment/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductsProvider()),ChangeNotifierProvider(create: (_)=>WishlistProvider()),ChangeNotifierProvider(create: (_)=>CartProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Fashion',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.lightBlue)),
      home: const SplashScreen(title: 'Open Fashion'),
    );
  }
}
