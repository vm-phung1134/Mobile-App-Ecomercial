import 'package:flutter/material.dart';
import 'product_grid_title.dart';
import 'product_manager.dart';

class ProductsGrid extends StatelessWidget{
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context){
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: ProductsManager().itemCount,
      itemBuilder: (ctx, i) => ProductGridTile(ProductsManager().items[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}