import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/product.dart';
import '../models/auth_token.dart';

import 'firebase_service.dart';

class ProductsService extends FirebaseService {
  ProductsService([AuthToken? authToken]) : super(authToken);

  Future<List<Product>> fetchProducts([bool filterByUser = false]) async {
    final List<Product> products = [];

    try {
      final filters =
          filterByUser ? 'orderBy = "creatorId"&equalTo="$userId"' : '';
      final productsUrl =
          Uri.parse('$databaseUrl/products.json?auth=$token&$filters');
      final response = await http.get(productsUrl);
      final productsMap = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        print(productsMap['error']);
        return products;
      }
      return products;
    } catch (error) {
      print(error);
      return products;
    }
  }

  Future<Product?> addProduct(Product product) async {
    log(token!);
    try {
      final url = Uri.parse('$databaseUrl/products.json?auth=$token');
      final response = await http.post(url,
          body: json.encode(product.toJson()..addAll({'creatorId': userId})));

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }

      return product.copyWith(id: json.decode(response.body)['name']);
    } catch (error) {
      print(error);
      return null;
    }
  }
}
