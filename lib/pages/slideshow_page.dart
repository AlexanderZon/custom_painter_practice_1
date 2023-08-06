import 'package:custom_painter_practice_1/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: CustomSlideshow1()
    );
  }
}

class CustomSlideshow1 extends StatelessWidget {
  const CustomSlideshow1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      primaryBulletSize: 15,
      secondaryBulletSize: 12,
      slides: [
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
      ],
      onTop: false,
      primaryColor: Colors.white,
    );
  }
}