import 'package:custom_painter_practice_1/theme/theme.dart';
import 'package:custom_painter_practice_1/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      body: HeaderOla(
        color: appTheme.secondaryHeaderColor,
      ),
    );
  }
}
