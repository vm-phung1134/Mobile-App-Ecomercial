import 'package:flutter/material.dart';
import 'package:shop_app/ui/product/components/product_grid.dart';

import 'package:provider/provider.dart';
import '../product/components/product_grid_title.dart';
import '../product/components/product_manager.dart';
import '../../../models/product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchValueController = TextEditingController();
  String searchValue = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchValueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Row(
            children: [_buildSearchField(context)],
          ),
          backgroundColor: Colors.white,
        ),
        body: _productsSearched(context));
  }

  Widget _buildSearchField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextFormField(
            controller: searchValueController,
            onChanged: (text) {
              this.setState(() {
                searchValue = text;
              });
            },
            decoration: InputDecoration(
              hintText: 'Nhập tên sản phẩm để tìm kiếm',
              hintStyle: TextStyle(color: Colors.grey[600]),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.0)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0)),
            ),
          )),
    );
  }

  Widget _productsSearched(BuildContext context) {
    final products = context.select<ProductsManager, List<Product>>(
        (productsManager) => productsManager.findByName(searchValue));
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductGridTile(products[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
