import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color colorInicio;
  final Color colorFinal;

  const IconHeader({
    super.key, 
    required this.icon, 
    required this.titulo, 
    required this.subtitulo, 
    this.colorInicio = Colors.grey, 
    this.colorFinal = Colors.blueGrey
  });

  @override
  Widget build(BuildContext context) {

    final Color textColor = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _IconHeaderBackground(colorInicio: colorInicio, colorFinal: colorFinal,),
        Positioned(
          top: -50,
          left: -50,
          child: FaIcon(icon, size: 250, color: Colors.white.withOpacity(0.2))
        ),
        Column(
          children: [
            SizedBox(height: 80, width: double.infinity,),
            Text(subtitulo, style: TextStyle(fontSize: 20, color: textColor)),
            SizedBox(height: 20,),
            Text(titulo, style: TextStyle(fontSize: 20, color: textColor)),
            SizedBox(height: 20,),
            FaIcon(icon, size: 80, color: Colors.white)
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color colorInicio;
  final Color colorFinal;
  const _IconHeaderBackground({
    super.key, required this.colorInicio, required this.colorFinal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            colorInicio,
            colorFinal,
          ]
        )
      ),
    );
  }
}