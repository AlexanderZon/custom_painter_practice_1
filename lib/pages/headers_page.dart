import 'package:custom_painter_practice_1/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
   
  const HeadersPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HeaderDiagonal(),
    );
  }
}