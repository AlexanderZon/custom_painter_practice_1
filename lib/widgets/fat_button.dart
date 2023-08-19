import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color colorInicio;
  final Color colorFinal;
  final Function onPress;

  const FatButton({
    super.key, 
    required this.text, 
    required this.onPress,
    this.icon = FontAwesomeIcons.a, 
    this.colorInicio = Colors.grey, 
    this.colorFinal = Colors.blueGrey, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Stack(
        children: [
          _FatButtonBackground(icon: icon,colorInicio: colorInicio, colorFinal: colorFinal,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 130, width: 40,),
              FaIcon(icon, size: 40, color: Colors.white,),
              SizedBox(width: 20,),
              Expanded(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18),)),
              FaIcon(FontAwesomeIcons.chevronRight, size: 20, color: Colors.white,),
              SizedBox(width: 40,),
            ],
          )
        ],
      ),
    );
  }
}

class _FatButtonBackground extends StatelessWidget {

  final IconData icon;
  final Color colorInicio;
  final Color colorFinal;
  
  const _FatButtonBackground({
    super.key, required this.icon, required this.colorInicio, required this.colorFinal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(4, 6), blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: <Color> [
          colorInicio,
          colorFinal,
        ])
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon, size: 150, color: Colors.white.withOpacity(0.2),)
            )
          ],
        ),
      ),
    );
  }
}