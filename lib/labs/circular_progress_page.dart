import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
   
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  double percentage = 0;
  double newPercentage = 0;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    controller.addListener(() {
      // print('valor controller: ${controller.value}');
      setState(() {
        percentage = lerpDouble(percentage, newPercentage, controller.value)!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          percentage = newPercentage;
          newPercentage += 10;
          if(newPercentage > 100) {
            newPercentage = 0;
            percentage = 0;
          }
          controller.forward(from: 0.0);
          setState(() { });
        }
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _RadialProgress(percentage),
          ),
        ),
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {

  final percentage;

  _RadialProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * .5, size.height / 2);
    final double radio = min(size.width * .5, size.height * .5);

    canvas.drawCircle(center, radio, paint);

    final paintArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi/2, 
      arcAngle, 
      false, 
      paintArc
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}