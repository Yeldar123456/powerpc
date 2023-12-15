import 'package:flutter/material.dart';
import 'package:powerpc/pages/balance_page.dart';
import 'package:powerpc/pages/cart_page.dart';
import 'package:powerpc/pages/elite_page.dart';
import 'package:powerpc/pages/help_page.dart';
import 'package:powerpc/pages/shop_page.dart';
import 'package:powerpc/pages/ultra_page.dart';
import 'package:powerpc/themes/light_mode.dart';
import 'pages/intro_page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/help_page': (context) => const HelpPage(),
        '/balance_page': (context) =>  const BalancePage(),
        '/elite_page':(context) => const ElitePage(),
        '/ultra_page': (context) => const UltraPage(),
      },
    );
  }
}

class CartModel extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(String productName, double productPrice) {
    _cartItems.add({'name': productName, 'price': productPrice});
    notifyListeners();
  }
}
