import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/ui/cart/views/cart_screen.dart';
import 'package:shop_app/ui/homepage/components/body.dart';
import 'package:shop_app/ui/homepage/components/navbar.dart';
import 'package:shop_app/ui/product/view/product_overview.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 94, 92, 92),
          elevation: 0,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: 8),
            Text(
              "PPUL STORE",
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )
          ]),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Color.fromARGB(255, 14, 117, 214),
              ),
            )
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home, color: Colors.black),
              ),
              Tab(
                icon: Icon(Icons.newspaper, color: Colors.black),
              ),
              Tab(
                icon: Icon(Icons.search, color: Colors.black),
              ),
              Tab(
                icon: Icon(Icons.shopping_cart, color: Colors.black),
              ),
              Tab(
                icon: Icon(Icons.person, color: Colors.black),
              ),
            ],
          ),
          titleSpacing: 20,
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Body(),
            ),
            Center(
              child: ProductsOverview(),
            ),
            Center(
              child: Text('data'),
            ),
            Center(
              child: CartScreeen(),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
