import 'package:flutter/material.dart';
import '../view/edit_product_screen.dart';
import 'product_manager.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';

class UserProductListTile extends StatelessWidget {
  final Product product;

  const UserProductListTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        child: Image.network(
          product.img,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(product.title),
      trailing: SizedBox(
        width: 100,
        child: Row(
            children: [buildEditButton(context), buildDeleteButton(context)]),
      ),
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        context.read<ProductsManager>().deleteProduct(product.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(const SnackBar(
              content: Text(
            'Product deleted',
            textAlign: TextAlign.center,
          )));
      },
      color: Theme.of(context).errorColor,
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context)
            .pushNamed(EditProductScreen.routeName, arguments: product.id);
      },
      color: Colors.black,
    );
  }
}
