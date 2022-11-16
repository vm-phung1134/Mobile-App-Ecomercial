import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0),
      child: Text(
        'Welcome To PPUL Store',
        style: TextStyle(
          fontSize: 30,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = Colors.blue[700]!,
        ),
      ),
    );
  }
}
