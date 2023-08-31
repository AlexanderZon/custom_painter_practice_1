import 'package:custom_painter_practice_1/pages/launcher_page.dart';
import 'package:custom_painter_practice_1/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (_) => ThemeChanger(2), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage(),
    );
  }
}
