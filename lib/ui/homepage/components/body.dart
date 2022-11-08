import 'package:flutter/material.dart';
import 'package:shop_app/ui/homepage/components/collection_card.dart';
import 'package:shop_app/ui/homepage/components/section_title.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset(
            "assets/images/slide_0.png",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SectionTitle(
              title: "Bộ sưu tập",
              pressSeeAll: () {},
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: CollectionCard(
                  image: "assets/images/colection_3.jpg",
                  title: "MÙA ĐÔNG ẤM ÁP",
                  press: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: CollectionCard(
                  image: "assets/images/colection_1.jpg",
                  title: "MÙA XUÂN GIÁ RÉT",
                  press: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: CollectionCard(
                  image: "assets/images/colection_2.jpg",
                  title: "MÙA HẠ MƯA SML",
                  press: () {},
                ),
              ),
            ]),
          ),
          // danh mục sản phẩm
        ]),
      ),
    );
  }
}
