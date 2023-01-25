import 'package:flutter/material.dart';

class BmiHeightCard extends StatelessWidget {
  const BmiHeightCard({Key? key, required this.color, required this.child})
      : super(key: key); //remove required
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey.withAlpha(110), Colors.white],
              begin: Alignment.topRight,
              end: Alignment.topLeft),
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child);
  }
}
