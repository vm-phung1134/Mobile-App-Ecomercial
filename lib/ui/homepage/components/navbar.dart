import 'package:flutter/material.dart';
class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('PPul Store',
            style: Theme.of(context).textTheme.subtitle1!.
            copyWith(fontSize: 23, color: Color.fromARGB(255, 0, 0, 0)),
            ),
             
            accountEmail: Text('3/2 -- NINH KIỀU - CẦN THƠ',
            style: Theme.of(context).textTheme.subtitle2),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/logo.jpg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 176, 202, 255)
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages),
            title: Text('TRANG CHỦ'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.propane_rounded),
            title: Text('SẢN PHẨM'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('BỘ SƯU TẬP'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('ĐƠN HÀNG'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.support),
            title: Text('LIÊN HỆ'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('HỆ THỐNG CỬA HÀNG'),
            onTap: () => null,
          )
        ],
      ),
    );
  }
}
