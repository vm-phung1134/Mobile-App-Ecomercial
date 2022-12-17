import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/auth_manager.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'PPul Store',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 23, color: const Color.fromARGB(255, 0, 0, 0)),
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
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 176, 202, 255)),
          ),
          ListTile(
            leading: const Icon(Icons.pages),
            title: const Text('TRANG CHỦ'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.propane_rounded),
            title: const Text('SẢN PHẨM'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('BỘ SƯU TẬP'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('ĐƠN HÀNG'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('QUẢN LÝ SẢN PHẨM'),
            onTap: () {
              Navigator.of(context).pushNamed('/user-products');
            },
          ),
          ListTile(
            leading: const Icon(Icons.support),
            title: const Text('LIÊN HỆ'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('ĐĂNG XUẤT'),
            onTap: () {
              context.read<AuthManager>().logout();
              Navigator.of(context).pushReplacementNamed('/auth');
            },
          )
        ],
      ),
    );
  }
}
