import 'package:animate_do/animate_do.dart';
import 'package:custom_painter_practice_1/widgets/emergency_header.dart';
import 'package:custom_painter_practice_1/widgets/fat_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLarge = MediaQuery.of(context).size.height > 500;
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items.map((item) {
      return FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: FatButton(
            icon: item.icon,
            text: item.texto,
            onPress: () {},
            colorInicio: item.color1,
            colorFinal: item.color2,
          ));
    }).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: (isLarge) ? 220 : 10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                if (isLarge)
                  SizedBox(
                    height: 50,
                  ),
                ...itemMap
              ],
            ),
          ),
          if (isLarge) _Header()
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
            icon: FontAwesomeIcons.plus,
            titulo: 'Asistencia Médica',
            subtitulo: 'Has Solicitado'),
        Positioned(
            top: 50,
            right: 0,
            child: RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                child: FaIcon(
                  FontAwesomeIcons.ellipsisVertical,
                  color: Colors.white,
                )))
      ],
    );
  }
}

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class _FatButton1 extends StatelessWidget {
  const _FatButton1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FatButton(
      text: "Motor Accident",
      icon: FontAwesomeIcons.carBurst,
      colorInicio: Color(0xff6989F5),
      colorFinal: Color(0xff906EF5),
      onPress: () {
        //
      },
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Has solicitado',
      titulo: 'Asistencia Técnica',
      colorInicio: Color(0xff526BF6),
      colorFinal: Color(0xff67ACF2),
    );
  }
}
