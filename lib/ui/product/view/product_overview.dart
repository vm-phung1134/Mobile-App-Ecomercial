import 'package:flutter/material.dart';
import 'package:shop_app/ui/product/components/product_grid.dart';
import 'package:shop_app/ui/product/view/product_detail.dart';

enum FilterOptions { favorites, all }

class ProductsOverview extends StatefulWidget {
  const ProductsOverview({super.key});
  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductsGrid(),
    );
  }

  Widget buildShoppingCartIcon() {
    return IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: (() {
        print('object');
      }),
    );
  }
}
