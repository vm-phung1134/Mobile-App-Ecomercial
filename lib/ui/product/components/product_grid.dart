import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_grid_title.dart';
import 'product_manager.dart';
import '../../../models/product.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid(this.searchValue, {super.key});
  final String searchValue;
  @override
  Widget build(BuildContext context) {
    final products = context.select<ProductsManager, List<Product>>(
        (productsManager) => productsManager.findByName(searchValue));
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductGridTile(products[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
