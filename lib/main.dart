import 'package:flutter/material.dart';
import 'package:mealapp/providers/provide_cart.dart';
import 'package:mealapp/providers/provide_order.dart';
import 'package:mealapp/screens/cart_screen.dart';
import 'package:mealapp/screens/order_screen.dart';
import 'package:mealapp/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

import 'screens/products_overview_screen.dart';
import 'package:mealapp/screens/product_detail_screen.dart';

import 'providers/provider_products.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProviderProducts()),
        ChangeNotifierProvider(create: (ctx) => ProvideCart()),
        ChangeNotifierProvider(create: (ctx) => ProvideOrder()),
      ],
      child: MaterialApp(
        title: 'Meal App',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Lato',
            primaryColor: Colors.blue,
            errorColor: Colors.red),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        },
      ),
    );
  }
}
