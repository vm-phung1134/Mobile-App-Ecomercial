import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/ui/cart/components/cart_card.dart';

import '../components/cart_manager.dart';

class CartScreeen extends StatelessWidget {
  const CartScreeen({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartManager>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Giỏ Hàng',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          buildCartSummary(cart, context),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: buildCartDetails(cart),
          )
        ],
      ),
    );
  }

  Widget buildCartSummary(CartManager cart, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Tổng Thanh Toán',
              style: TextStyle(fontSize: 15),
            ),
            const Spacer(),
            Chip(
              label: Text(
                '\$${cart.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.headline6?.color,
                ),
              ),
              backgroundColor: Color.fromARGB(255, 214, 4, 4),
            ),
            TextButton(
              onPressed: () {
                print('Đơn hàng của bạn đã được xác nhận');
              },
              child: const Text(
                'Đặt Hàng',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCartDetails(CartManager cart) {
    return ListView(
      children: cart.productEntries
          .map(
            (entry) => CartCard(
              productId: entry.key,
              card: entry.value,
            ),
          )
          .toList(),
    );
  }
}
