import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Widget _buildSearchField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Nhập tên sản phẩm để tìm kiếm',
      ),
    );
  }
}
