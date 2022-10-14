import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    Key? key,
    required this.title,
    required this.image,
    required this.press,
  }) : super(key: key);
  final String image, title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 146, 146, 146),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17, 
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Noto Sans Korean'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
