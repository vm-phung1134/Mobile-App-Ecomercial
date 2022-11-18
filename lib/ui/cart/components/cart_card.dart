import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/ui/cart/components/cart_manager.dart';
import '../../../models/cart.dart';
import '../../message/dialog_message.dart';

class CartCard extends StatelessWidget {
  final String productId;
  final Cart card;
  const CartCard({
    required this.productId,
    required this.card,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: SizedBox(
          height: 50,
          width: 50,
          child: Image.network(
            card.image,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(card.title),
        subtitle: Text(
            'Giá: \$${(card.price * card.quantity)} (SL: ${card.quantity})'),
        trailing: TextButton(
          child: const Icon(
            Icons.delete,
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {
            context.read<CartManager>().removeItem(productId);
          },
        ),
      ),
    );
  }
}
