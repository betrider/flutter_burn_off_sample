import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final LinearGradient background;
  final String title;
  final String icon;
  final Widget child;

  const CustomPage({super.key, required this.title, required this.background, required this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
