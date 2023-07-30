import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {
   
  const AnimatedSquarePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: _AnimatedSquare(),
      ),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  const _AnimatedSquare({super.key});

  @override
  State<_AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<_AnimatedSquare> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  late Animation<double> moveRight;
  late Animation<double> moveLeft;
  late Animation<double> moveUp;
  late Animation<double> moveDown;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 4000)
    );

    moveRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, .25, curve: Curves.bounceOut))
    );
    moveLeft = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(.5, .75, curve: Curves.bounceOut))
    );

    moveUp = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(.25, .5, curve: Curves.bounceOut))
    );
    moveDown = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(.75, 1, curve: Curves.bounceOut))
    );

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed){
        controller.repeat();
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
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Square(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moveRight.value + moveLeft.value, moveUp.value + moveDown.value),
          child: child
        );
      },
    );
  }
}

class _Square extends StatelessWidget {
  const _Square({super.key});

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