import 'package:custom_painter_practice_1/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(bottom: 0, right: 0, child: _BottomNewList())
        ],
      ),
    );
  }
}

class _BottomNewList extends StatelessWidget {
  const _BottomNewList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.resolveWith(
                  (states) => Size(size.width * 0.9, 100)))),
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith((states) =>
                  (appTheme.darkTheme)
                      ? appTheme.currentTheme.secondaryHeaderColor
                      : Color(0xffED6762)),
              shape: MaterialStateProperty.resolveWith((states) =>
                  RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))))),
          child: Text(
            'CREATE NEW LIST',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 3),
          )),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  _MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: _Titulo(),
        // ),
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
              minHeight: 170,
              maxHeight: 200,
              child: Container(
                  alignment: Alignment.centerLeft,
                  color: appTheme.scaffoldBackgroundColor,
                  child: _Titulo()),
            )),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(
              height: 100,
            )
          ]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight >= minHeight ? maxHeight : minHeight;

  @override
  double get minExtent => maxHeight >= minHeight ? minHeight : maxHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _ListTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  _ListTareas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length, itemBuilder: (context, index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      child: Text(
        titulo,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: (appTheme.darkTheme) ? Colors.grey : color,
          borderRadius: BorderRadius.circular(30)),
    );
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128),
                fontSize: 50),
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: Text(
                'List',
                style: TextStyle(
                    color: Color(0xffD93A30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}
