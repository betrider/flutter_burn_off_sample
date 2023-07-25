import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Widget child;

  const CardItem({super.key, 
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 25.0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 250,
        width: MediaQuery.of(context).size.width - 150,
        child: Container(
          margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
          child: child,
        ),
      ),
    );
  }
}
