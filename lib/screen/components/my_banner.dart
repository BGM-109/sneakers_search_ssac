import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyBanner extends StatefulWidget {
  const MyBanner({Key? key}) : super(key: key);

  @override
  State<MyBanner> createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  final bannerList = [
    'assets/banners/banner1.png',
    'assets/banners/banner2.png',
    'assets/banners/banner3.png',
    'assets/banners/banner4.png',
    'assets/banners/banner5.png',
    'assets/banners/banner6.png',
    'assets/banners/banner7.png',
    'assets/banners/banner8.png',
    'assets/banners/banner9.png',
    'assets/banners/banner10.png'
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: bannerList.length,
      options:
          CarouselOptions(autoPlay: true, viewportFraction: 1, height: 100),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        final image = bannerList[index];
        return Image(
          image: AssetImage(image),
        );
      },
    );
  }
}
