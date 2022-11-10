import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/ui/auth/auth_manager.dart';
import 'package:shop_app/ui/auth/auth_screen.dart';
import 'package:shop_app/ui/cart/components/cart_manager.dart';
import 'package:shop_app/ui/homepage/views/homepage_overview.dart';
import 'package:shop_app/ui/product/components/product_manager.dart';
import 'package:shop_app/ui/product/view/product_detail.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/ui/splash_screen.dart';

Future<void> main() async {
  // Load the .env file
  await dotenv.load();
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
        ChangeNotifierProvider(create: (ctx) => AuthManager()),
      ],
      child: Consumer<AuthManager>(builder: (ctx, authManager, child) {
        return MaterialApp(
          title: 'My Shop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue,
            ).copyWith(
              secondary: const Color.fromARGB(255, 255, 253, 253),
            ),
          ),
          // home: authManager.isAuth
          //     ? const SafeArea(child: Home())
          //     : FutureBuilder(
          //         future: authManager.tryAutoLogin(),
          //         builder: (context, snapshot) {
          //           return snapshot.connectionState == ConnectionState.waiting
          //               ? const SplashScreen()
          //               : const AuthScreen();
          //         },
          //       ),
          initialRoute: authManager.isAuth ? '/home' : '/auth',
          routes: {
            '/home': (context) => const SafeArea(child: Home()),
            '/auth': (_) => const AuthScreen()
          },
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
        );
      }),
    );
  }
}

// tao trang homepage - appbar,navbar,tapbar - goi trang productoverview o tap 2
