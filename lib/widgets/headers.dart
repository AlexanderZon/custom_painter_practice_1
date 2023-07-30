import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        color: Color(0xff615AAB),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .fill
    paint.strokeWidth = 2;

    final path = new Path();

    // Dibujar con el path y el paint
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .fill
    paint.strokeWidth = 2;

    final path = new Path();

    // Dibujar con el path y el paint
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .fill
    paint.strokeWidth = 2;

    final path = new Path();

    // Dibujar con el path y el paint
    final double header_height = 0.25;
    final double header_point_height = 50;

    path.lineTo(0, size.height * header_height);
    path.lineTo(size.width * 0.5, (size.height * header_height) + header_point_height);
    path.lineTo(size.width, size.height * header_height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .fill
    paint.strokeWidth = 2;

    final path = new Path();

    // Dibujar con el path y el paint

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderOla extends StatelessWidget {
  const HeaderOla({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderOlaPainter(),
      ),
    );
  }
}

class _HeaderOlaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .fill
    paint.strokeWidth = 2;

    final path = new Path();

    // Dibujar con el path y el paint
    // Ola superior
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Ola inferior
    // path.moveTo(0, size.height);
    // path.lineTo(0, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.70, size.width * 0.5, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.80, size.width, size.height * 0.75);
    // path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class HeaderOlaGradiente extends StatelessWidget {
  const HeaderOlaGradiente({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderOlaGradientePainter(),
      ),
    );
  }
}

class _HeaderOlaGradientePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 155.0), 
      radius: 180
    );

    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      stops: [
        0.0,
        0.5,
        1.0
      ]
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    // Propiedades
    paint.color = const Color.fromARGB(255, 222, 8, 48);
    paint.style = PaintingStyle.fill; // .fill
    paint.strokeWidth = 2;

    final path = Path();

    // Dibujar con el path y el paint
    // Ola superior
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Ola inferior
    // path.moveTo(0, size.height);
    // path.lineTo(0, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.70, size.width * 0.5, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.80, size.width, size.height * 0.75);
    // path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
