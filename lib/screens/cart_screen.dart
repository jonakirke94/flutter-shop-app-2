import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealapp/providers/provide_cart.dart' show ProvideCart;
import 'package:mealapp/providers/provide_order.dart';
import 'package:mealapp/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ProvideCart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Consumer<ProvideCart>(
                    builder: (ctx, cart, ch) => Chip(
                      label: Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        Provider.of<ProvideOrder>(context, listen: false)
                            .addOrder(
                                cart.items.values.toList(), cart.totalAmount);
                        cart.clear();
                      },
                      child: Text('ORDER NOW',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, idx) => CartItem(
                id: cart.items.values.toList()[idx].id,
                title: cart.items.values.toList()[idx].title,
                productId: cart.items.keys.toList()[idx],
                quantity: cart.items.values.toList()[idx].quantity,
                price: cart.items.values.toList()[idx].price),
            itemCount: cart.itemCount,
          ))
        ],
      ),
    );
  }
}
