import 'package:custom_painter_practice_1/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CircularGraphicsPage extends StatefulWidget {
  const CircularGraphicsPage({super.key});

  @override
  State<CircularGraphicsPage> createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {

  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          percentage += 10;
          if(percentage > 100) {
            percentage = 0;
          }
          setState(() { });
        }
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percentage: percentage, color: Colors.pink,),
              CustomRadialProgress(percentage: percentage, color: Colors.amber)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percentage: percentage, color: Colors.blue,),
              CustomRadialProgress(percentage: percentage, color: Colors.orange)
            ],
          )
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;
  final double percentage;
  
  const CustomRadialProgress({
    super.key,
    required this.percentage, 
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: color,
        secondaryColor: Colors.grey,
        stroke: 12,
        backgroundStroke: 10,
      ),
    );
  }
}