import 'package:custom_painter_practice_1/pages/slideshow_page.dart';
import 'package:custom_painter_practice_1/pages/animations_page.dart';
import 'package:custom_painter_practice_1/pages/circular_graphics_page.dart';
import 'package:custom_painter_practice_1/pages/emergency_page.dart';
import 'package:custom_painter_practice_1/pages/headers_page.dart';
import 'package:custom_painter_practice_1/pages/pinterest_page.dart';
import 'package:custom_painter_practice_1/pages/sliver_list_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow Page', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencias', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro animado', CuadradoAnimado()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra de progreso',
      CircularGraphicsPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.phone, 'Slivers', SliverListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
