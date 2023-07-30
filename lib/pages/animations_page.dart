import 'dart:math' as Math;

import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
   
  const AnimationsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado()
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> moveToRight;
  late Animation<double> bigger;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 4000)
    );

    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut)
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, .25, curve: Curves.easeOut))
    );

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(.75, 1, curve: Curves.easeOut))
    );

    moveToRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, .3, curve: Curves.easeIn))
    );

    bigger = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, .1, curve: Curves.easeInCubic))
    );

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed){
        // controller.repeat();
        // controller.reverse();
        // controller.reset();
      }
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
    // Play / reproducción
    controller.forward();

    return AnimatedBuilder(
      animation: controller, 
      child: _Rectangulo(),
      builder: (context, child) {

        print('Opacidad: ${opacity.value}');
        print('Rotacion: ${rotation.value}');
        
        return Transform.translate(
          offset: Offset(moveToRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: bigger.value,
                child: child
              ),
            )
          ),
        );
      },
    );

  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}

