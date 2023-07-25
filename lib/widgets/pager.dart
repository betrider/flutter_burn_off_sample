import 'package:flutter/material.dart';
import 'package:flutter_application_30/widgets/page.dart';
import 'package:flutter_application_30/widgets/rectangle_indicator.dart';

class MenuPager extends StatefulWidget {
  final List<CustomPage> children;

  const MenuPager({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  MenuPagerState createState() => MenuPagerState();
}

const double _kViewportFraction = 0.75;

class MenuPagerState extends State<MenuPager> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _renderBackground(widget.children[selectedPageIndex].background),
        _renderTitle(widget.children[selectedPageIndex].title),
        _renderBottomNav(
            widget.children.map((page) => page.icon).toList()),
        _renderContents(
            widget.children, selectedPageIndex, handlePageChanged),
      ],
    );
  }

  void handlePageChanged(int pageIndex) {
    setState(() {
      selectedPageIndex = pageIndex;
    });
  }

  Widget _renderContents(List<CustomPage> pages, int selectedPageIndex,
      void Function(int pageIndex) onPageChanged) {
    return PageView(
      controller: PageController(
          initialPage: selectedPageIndex, viewportFraction: _kViewportFraction),
      onPageChanged: onPageChanged,
      children: List<Widget>.generate(pages.length, (index) {
        return _renderPage(pages[index], index, selectedPageIndex);
      }, growable: false),
    );
  }

  Widget _renderPage(CustomPage page, int index, int selectedPageIndex) {
    var resizeFactor = 1 - ((selectedPageIndex - index).abs() * 0.2).clamp(0.0, 1.0);
    return Center(
      child: Container(
        alignment: Alignment.center +
            Alignment((selectedPageIndex - index) * _kViewportFraction, 0.0),
        width: 350.0 * resizeFactor,
        height: 600.0 * resizeFactor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: page,
          ),
        ),
      ),
    );
  }

  Widget _renderBottomNav(List<String> iconImages) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: FittedBox(
          alignment: FractionalOffset.bottomCenter,
          child: RectangleIndicator(
            icons: iconImages,
            selectedIndex: selectedPageIndex,
          ),
        ),
      ),
    );
  }

  Widget _renderTitle(String titleText) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Text(
          titleText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Dosis',
          ),
        ),
      ),
    );
  }

  Widget _renderBackground(LinearGradient gradient2) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient2,
        ),
      ),
    );
  }
}
