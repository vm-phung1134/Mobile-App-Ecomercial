import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class ProductsManager with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      img: 'assets/images/product_0.png',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      img: 'assets/images/product_1.png',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      img: 'assets/images/product_2.png',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      img: 'assets/images/product_3.png',
    ),
  ];
  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Product findByName(String title) {
    return _items.firstWhere((element) => element.title == title);
  }

  void addProduct(Product product) {
    _items.add(
      product.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }

  void deleteProduct(String id) {
    final index = _items.indexWhere((element) => element.id == id);
    _items.removeAt(index);
    notifyListeners();
  }
}
