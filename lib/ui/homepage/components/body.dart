import 'package:flutter/material.dart';
import 'package:shop_app/ui/homepage/components/collection_card.dart';
import 'package:shop_app/ui/homepage/components/section_title.dart';

import 'package:carousel_slider/carousel_slider.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> imageSlider = [
      "assets/images/slide_0.png",
      "assets/images/slide_1.jpg",
      "assets/images/slide_2.jpg",
      "assets/images/slide_3.jpg",
    ];
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CarouselSlider.builder(
            options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: const Duration(milliseconds: 2000)),
            itemCount: imageSlider.length,
            itemBuilder: (context, itemIndex, realIndex) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imageSlider[itemIndex], fit: BoxFit.cover),
              );
            },
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
