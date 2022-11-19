import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/ui/cart/components/cart_manager.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetail(
    this.product, {
    super.key,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chi Tiết Sản Phẩm',
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(
              height: 300,
              width: 200,
              child: Image.network(
                product.img,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
              ),
            ),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {
                      final cart = context.read<CartManager>();
                      cart.addItem(product);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentMaterialBanner()
                        ..showSnackBar(SnackBar(
                            content: const Text(
                                'Sản phẩm đã được thêm vào giỏ hàng'),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'Hoàn tác',
                              onPressed: (() {
                                cart.removeSingleItem(product.id!);
                              }),
                            )));
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20))),
                    child: const Text('Thêm vào giỏ hàng',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: OutlinedButton(
                    onPressed: (() {}),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20))),
                    child: const Text('Mua ngay',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
