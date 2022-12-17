import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import '../view/product_detail.dart';
import '../../cart/components/cart_manager.dart';

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
          child: Image.network(
            product.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: const Color.fromARGB(115, 24, 24, 24),
      // leading: IconButton(
      //   icon: const Icon(Icons.favorite),
      //   color: Theme.of(context).colorScheme.secondary,
      //   onPressed: () {
      //     print('Toggle a favorate product');
      //   },
      // ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            '\$${product.price}',
            textAlign: TextAlign.left,
          )
        ],
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          final cart = context.read<CartManager>();
          cart.addItem(product);
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showSnackBar(SnackBar(
                content: const Text('Sản phẩm đã được thêm vào giỏ hàng'),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'Hoàn tác',
                  onPressed: (() {
                    cart.removeSingleItem(product.id!);
                  }),
                )));
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
