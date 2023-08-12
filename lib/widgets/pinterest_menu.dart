import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final IconData icon;
  final void Function() onPressed;
  final Color activeColor;
  final Color color;

  PinterestButton({required this.onPressed, required this.icon, this.activeColor = Colors.black, this.color = Colors.blueGrey});
}

class PinterestMenu extends StatelessWidget {

  final bool visible;
  final List<PinterestButton> items;

  PinterestMenu({super.key, this.visible = true, required this.items });

  // final List<PinterestButton> items = [
  //   PinterestButton(icon: Icons.pie_chart, onPressed: (){ print('Icon pie_cart'); }),
  //   PinterestButton(icon: Icons.search, onPressed: (){ print('Icon search'); }),
  //   PinterestButton(icon: Icons.notifications, onPressed: (){ print('Icon notifications'); }),
  //   PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print('Icon supervised_user_circle'); }),
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: visible ? 1 : 0,
        child: _PinterestMenuBackground(
          child: _MenuItems(items),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;
  
  const _PinterestMenuBackground({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38, 
            blurRadius: 10, 
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;
  
  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _MenuItem(index, menuItems[index])),
    );
  }
}

class _MenuItem extends StatelessWidget {

  final int index;
  final PinterestButton item;

  const _MenuItem(this.index, this.item);

  @override
  Widget build(BuildContext context) {

    final selectedItem = Provider.of<_MenuModel>(context).selectedItem;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (selectedItem == index) ? 35 : 25,
          color: (selectedItem == index) ? item.activeColor : item.color,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  
  int _selectedItem = 0;

  int get selectedItem => _selectedItem;

  set selectedItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }

}