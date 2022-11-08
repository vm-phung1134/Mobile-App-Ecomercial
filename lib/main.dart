import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/ui/cart/components/cart_manager.dart';
import 'package:shop_app/ui/homepage/views/homepage_overview.dart';
import 'package:shop_app/ui/product/components/product_manager.dart';
import 'package:shop_app/ui/product/view/product_detail.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartManager(),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: Color.fromARGB(255, 255, 253, 253),
          ),
        ),
        home: const SafeArea(child: Home()),
        onGenerateRoute: (settings) {
          if (settings.name == ProductDetail.routeName) {
            final productId = settings.arguments as String;
            return MaterialPageRoute(builder: (ctx) {
              return ProductDetail(
                  ctx.read<ProductsManager>().findById(productId));
            });
          }
          return null;
        },
      ),
    );
  }
}

// tao trang homepage - appbar,navbar,tapbar - goi trang productoverview o tap 2
