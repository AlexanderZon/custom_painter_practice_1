import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final double percentage;
  final Color primaryColor;
  final Color? secondaryColor;
  final double? stroke;
  final double? backgroundStroke;

  const RadialProgress({
    super.key, 
    required this.percentage, 
    required this.primaryColor,
    this.secondaryColor, 
    this.stroke,
    this.backgroundStroke,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late double lastPercentage;

  @override
  void initState() {
    lastPercentage = widget.percentage;
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);
    final animationDifference = widget.percentage - lastPercentage;
    lastPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _RadialProgress( 
              percentage: (widget.percentage - animationDifference ) + ( animationDifference * controller.value ),
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor ?? Colors.grey,
              stroke: widget.stroke ?? 10,
              backgroundStroke: widget.backgroundStroke ?? 10,
            )
          ),
        );
      },
    );
  }
}

class _RadialProgress extends CustomPainter {

  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double stroke;
  final double backgroundStroke;

  _RadialProgress({
    required this.percentage, 
    required this.primaryColor, 
    required this.secondaryColor,
    required this.stroke,
    required this.backgroundStroke,
  });

  @override
  void paint(Canvas canvas, Size size) {

    final rect = Rect.fromCircle(center: Offset.zero, radius: 180);

    final Gradient gradient = new LinearGradient(
      colors: [
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Colors.red
      ]
    );

    final paint = Paint()
      ..strokeWidth = backgroundStroke
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * .5, size.height / 2);
    final double radio = min(size.width * .5, size.height * .5);

    canvas.drawCircle(center, radio, paint);

    final paintArc = Paint()
      ..strokeWidth = stroke
      ..color = primaryColor
      // ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
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