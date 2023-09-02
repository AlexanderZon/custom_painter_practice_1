import 'package:custom_painter_practice_1/theme/theme.dart';
import 'package:custom_painter_practice_1/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge = MediaQuery.of(context).size.height > 500;
    return Scaffold(
        body: isLarge
            ? Column(
                children: [
                  Expanded(child: CustomSlideshow1()),
                  Expanded(child: CustomSlideshow1())
                ],
              )
            : Row(
                children: [
                  Expanded(child: CustomSlideshow1()),
                  Expanded(child: CustomSlideshow1())
                ],
              ));
  }
}

class CustomSlideshow1 extends StatelessWidget {
  const CustomSlideshow1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final children = [
      SvgPicture.asset('assets/svg/slide-1.svg'),
      SvgPicture.asset('assets/svg/slide-2.svg'),
      SvgPicture.asset('assets/svg/slide-3.svg'),
      SvgPicture.asset('assets/svg/slide-4.svg'),
    ];

    return Slideshow(
      primaryBulletSize: 15,
      secondaryBulletSize: 12,
      slides: children,
      onTop: false,
      primaryColor: appTheme.darkTheme
          ? appTheme.currentTheme.primaryColorDark
          : appTheme.currentTheme.primaryColorLight,
    );
  }
}
