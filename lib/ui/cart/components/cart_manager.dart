import 'package:flutter/cupertino.dart';

import '../../../models/cart.dart';
import '../../../models/product.dart';

class CartManager with ChangeNotifier {
  final Map<String, Cart> _items = {};
  int get productCount {
    return _items.length;
  }

  List<Cart> get products {
    return _items.values.toList();
  }

  Iterable<MapEntry<String, Cart>> get productEntries {
    return {..._items}.entries; // get key tu object
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cart) {
      total += cart.price * cart.quantity;
    });
    return total; // lay gia tong gia san pham
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (existingCart) => existingCart.copyWith(
          quantity: existingCart.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
          product.id!,
          () => Cart(
                id: 'c${DateTime.now().toIso8601String()}',
                title: product.title,
                quantity: 1,
                price: product.price,
                image: product.img,
              ));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]?.quantity as num > 1) {
      _items.update(
          productId,
          (exitstingCartItem) => exitstingCartItem.copyWith(
              quantity: exitstingCartItem.quantity - 1));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
