import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import '../view/product_detail.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: GridTile(
        footer: buildGridFooterBar(context),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetail.routeName,
              arguments: product.id,
            );
          },
          child: Image.asset(
            product.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Color.fromARGB(115, 24, 24, 24),
      leading: IconButton(
        icon: const Icon(Icons.favorite),
        color: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          print('Toggle a favorate product');
        },
      ),
      title: Column(
        children: [
          Text(
            product.title,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '\$${product.price}',
            textAlign: TextAlign.justify,
          )
        ],
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          print('Add item to cart');
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
