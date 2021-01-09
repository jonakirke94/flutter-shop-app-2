import 'package:flutter/material.dart';
import 'package:mealapp/providers/provider_products.dart';
import 'package:mealapp/widgets/app_drawer.dart';
import 'package:mealapp/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = 'user-product-item';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProviderProducts>(context).items;

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (ctx, idx) => Column(
            children: [
              UserProductItem(products[idx].title, products[idx].imageUrl),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
