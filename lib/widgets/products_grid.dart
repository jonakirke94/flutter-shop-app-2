import 'package:flutter/material.dart';
import 'package:mealapp/providers/provider_products.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProviderProducts>(context);
    final productList = showFavs ? productsData.favorites : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productList.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: productList[i],
        child: ProductItem(),
      ), // defines how every cell/item is build
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // defines how the grid should be structured with how many columns for example
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
