import 'package:flutter/material.dart';

Future<bool?> showMessageConfirm(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
              title: const Text('Bạn chắc chứ ?'),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  child: const Text('Hủy'),
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                ),
                TextButton(
                  child: const Text('Chấp Nhận'),
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                )
              ]));
}
