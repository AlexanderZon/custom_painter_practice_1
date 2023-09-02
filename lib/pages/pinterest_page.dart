import 'package:custom_painter_practice_1/theme/theme.dart';
import 'package:custom_painter_practice_1/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [_PinterestGrid(), _PinterestLocatedMenu()],
        ),
        // body: PinterestMenu(),
      ),
    );
  }
}

class _PinterestLocatedMenu extends StatelessWidget {
  const _PinterestLocatedMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final viewMenu = Provider.of<_MenuModel>(context).visible;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (width > 500) {
      width = width - 300;
    }
    return Positioned(
        bottom: 30,
        child: Container(
          width: width,
          child: Align(
            child: PinterestMenu(
              visible: viewMenu,
              backgroundColor: appTheme.scaffoldBackgroundColor,
              items: [
                PinterestButton(
                    icon: Icons.pie_chart,
                    onPressed: () {
                      print('Icon pie_cart');
                    }),
                PinterestButton(
                    icon: Icons.search,
                    onPressed: () {
                      print('Icon search');
                    }),
                PinterestButton(
                    icon: Icons.notifications,
                    onPressed: () {
                      print('Icon notifications');
                    }),
                PinterestButton(
                    icon: Icons.supervised_user_circle,
                    onPressed: () {
                      print('Icon supervised_user_circle');
                    }),
              ],
            ),
          ),
        ));
  }
}

class _PinterestGrid extends StatefulWidget {
  const _PinterestGrid({super.key});

  @override
  State<_PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {
  ScrollController controller = ScrollController();
  double previousScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > previousScroll && controller.offset > 0) {
        Provider.of<_MenuModel>(context, listen: false).visible = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).visible = true;
      }
      previousScroll = controller.offset;
      // print('Scrolllistener ${controller.offset}');
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
    bool isLarge = MediaQuery.of(context).size.width > 500;
    final shortPattern = [
      QuiltedGridTile(2, 2),
      QuiltedGridTile(3, 2),
      QuiltedGridTile(2, 2),
      QuiltedGridTile(3, 2),
      QuiltedGridTile(2, 2),
    ];
    final largePattern = [
      QuiltedGridTile(2, 2),
      QuiltedGridTile(3, 2),
      QuiltedGridTile(2, 2),
      QuiltedGridTile(3, 2),
      QuiltedGridTile(3, 2),
      QuiltedGridTile(2, 2),
    ];

    return GridView.custom(
      controller: controller,
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: isLarge ? 6 : 4,
        mainAxisSpacing: isLarge ? 5 : 4,
        crossAxisSpacing: 0,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: isLarge ? largePattern : shortPattern,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _PinterestItem(index: index),
          childCount: 101),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _visible = true;

  bool get visible => _visible;

  set visible(bool view) {
    _visible = view;
    notifyListeners();
  }
}
