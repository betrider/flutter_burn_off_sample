import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RectangleIndicator extends StatelessWidget {
  final List<String> icons;
  final int selectedIndex;

  const RectangleIndicator({
    super.key,
    required this.icons,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        icons.length,
        (i) => _Icon(
          key: Key(icons[i]),
          baseColor: Colors.white54,
          selectedColor: Colors.white,
          image: icons[i],
          isSelected: i == selectedIndex,
        ),
      ),
    );
  }
}

class _Icon extends StatefulWidget {
  final double? radius = 3.0;
  final Color? baseColor;
  final Color? selectedColor;
  final String? image;
  final bool? isSelected;

  const _Icon({
    super.key,
    this.baseColor,
    this.selectedColor,
    this.image,
    this.isSelected,
  });

  @override
  State<StatefulWidget> createState() => _IconState();
}

class _IconState extends State<_Icon> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSelected!) {
      controller.forward();
    } else {
      controller.reverse();
    }

    return Column(
      children: <Widget>[
        Stack(
          alignment: FractionalOffset.center,
          children: <Widget>[
            ScaleTransition(
              scale: CurvedAnimation(parent: controller, curve: Curves.linear, reverseCurve: Curves.bounceOut),
              child: Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Column(
                  children: <Widget>[
                    _renderRectangle(widget.selectedColor!),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: _renderIcon(widget.selectedColor!),
                    ),
                  ],
                ),
              ),
            ),
            _renderRectangle(widget.baseColor!),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: _renderIcon(widget.baseColor!),
            ),
          ],
        ),
      ],
    );
  }

  SvgPicture _renderIcon(Color color) {
    return SvgPicture.asset(
      widget.image!,
      color: color,
      width: 30.0,
      height: 30.0,
    );
  }

  Container _renderRectangle(Color color) {
    return Container(
      width: widget.radius! * 20,
      height: widget.radius! / 2,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
      ),
    );
  }
}
