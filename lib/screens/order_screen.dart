import 'package:flutter/material.dart';
import 'package:mealapp/providers/provide_order.dart';
import 'package:mealapp/widgets/app_drawer.dart';
import 'package:mealapp/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = 'order-screen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<ProvideOrder>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) => OrderItem(orderData.orders[idx]),
        itemCount: orderData.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
