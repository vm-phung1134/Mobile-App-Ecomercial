import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/ui/product/components/product_grid.dart';
import 'package:shop_app/ui/product/components/product_manager.dart';

enum FilterOptions { favorites, all }

class ProductsOverview extends StatefulWidget {
  const ProductsOverview({super.key});
  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  late Future<void> _fetchProducts;
  final TextEditingController searchValueController = TextEditingController();
  String searchValue = '';

  @override
  void initState() {
    super.initState();
    _fetchProducts = context.read<ProductsManager>().fetchProducts();
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
      body: FutureBuilder(
        future: _fetchProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ProductsGrid(searchValue);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildShoppingCartIcon() {
    return IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: (() {
        print('object');
      }),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextFormField(
            // controller: searchValueController,
            onChanged: (text) {
              setState(() {
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
}
