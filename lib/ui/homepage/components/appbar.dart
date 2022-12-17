import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset("assets/icons/Location.svg"),
        const SizedBox(width: 8),
        Text(
          "PPUL STORE",
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        )
      ]),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/Notification.svg"),
        )
      ],
    );
  }
}
