import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO: Borrar
import 'package:flutter_svg/flutter_svg.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool onTop;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBulletSize;
  final double secondaryBulletSize;
  
  const Slideshow({
    super.key, 
    required this.slides, 
    this.onTop = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey, 
    this.primaryBulletSize = 12, 
    this.secondaryBulletSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {  
              Future.delayed(Duration.zero, (){
                Provider.of<_SlideshowModel>(context, listen: false).primaryColor = primaryColor;
                Provider.of<_SlideshowModel>(context, listen: false).secondaryColor = secondaryColor;
                Provider.of<_SlideshowModel>(context, listen: false).primaryBulletSize = primaryBulletSize;
                Provider.of<_SlideshowModel>(context, listen: false).secondaryBulletSize = secondaryBulletSize;
              });

              return _CreateSlideshowStruct(onTop: onTop, slides: slides);
            },
          )
        ),
      ),
    );
  }
}

class _CreateSlideshowStruct extends StatelessWidget {
  const _CreateSlideshowStruct({
    super.key,
    required this.onTop,
    required this.slides,
  });

  final bool onTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(onTop) _Dots(slides.length),
        Expanded(
          child: _Slides(slides)
        ),
        if(!onTop) _Dots(slides.length),
      ],
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((e) => _Slide(e)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide
    );
  }
}


class _Dots extends StatelessWidget {

  final int quantity;

  const _Dots(this.quantity);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(quantity, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  
  final int index;
  
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final _SlideshowModel ssModel = Provider.of<_SlideshowModel>(context);
    final bool isActive = ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: (isActive) ? ssModel.primaryBulletSize : ssModel.secondaryBulletSize,
      height: (isActive) ? ssModel.primaryBulletSize : ssModel.secondaryBulletSize,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (isActive) ? ssModel.primaryColor : ssModel.secondaryColor,
        shape: BoxShape.circle
      ),
    );
  }
}

class _SlideshowModel extends ChangeNotifier {
  
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBulletSize = 12;
  double _secondaryBulletSize = 12;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;

  set primaryColor(Color color){
    _primaryColor = color;
    notifyListeners();
  }

  Color get secondaryColor => _secondaryColor;

  set secondaryColor(Color color){
    _secondaryColor = color;
    notifyListeners();
  }

  double get primaryBulletSize => _primaryBulletSize;

  set primaryBulletSize(double size){
    _primaryBulletSize = size;
    notifyListeners();
  }

  double get secondaryBulletSize => _secondaryBulletSize;

  set secondaryBulletSize(double size){
    _secondaryBulletSize = size;
    notifyListeners();
  }

}