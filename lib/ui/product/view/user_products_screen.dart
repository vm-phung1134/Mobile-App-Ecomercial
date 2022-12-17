import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/user_product_list_tile.dart';
import '../components/product_manager.dart';
import 'edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserProductsScreen({super.key});

  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductsManager>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý sản phẩm"),
        backgroundColor: Colors.black,
      ),
      // drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: FutureBuilder(
          future: _refreshProducts(context),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
                child: buildUserProductListView(productsManager),
                onRefresh: () => _refreshProducts(context));
          },
        ),
      ),
      bottomNavigationBar: buildAddButton(context),
    );
  }

  Widget buildUserProductListView(ProductsManager productsManager) {
    return Consumer<ProductsManager>(builder: (ctx, productsManager, child) {
      return ListView.builder(
          itemCount: productsManager.itemCount,
          itemBuilder: (ctx, i) => Column(children: [
                UserProductListTile(productsManager.items[i]),
                const Divider(),
              ]));
    });
  }

  Widget buildAddButton(BuildContext context) {
    return SizedBox(
        height: 50.0,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Thêm sản phẩm",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Icon(Icons.add)
                ]),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            }));
  }
}
