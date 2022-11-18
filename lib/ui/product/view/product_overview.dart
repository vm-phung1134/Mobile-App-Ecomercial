import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/ui/product/components/product_grid.dart';
import 'package:shop_app/ui/product/components/product_manager.dart';
import 'package:shop_app/ui/product/view/product_detail.dart';

enum FilterOptions { favorites, all }

class ProductsOverview extends StatefulWidget {
  const ProductsOverview({super.key});
  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  late Future<void> _fetchProducts;

  @override
  void initState() {
    super.initState();
    _fetchProducts = context.read<ProductsManager>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _fetchProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const ProductsGrid();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
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
