import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.padding = const EdgeInsets.only(left: 16),
    this.margin,
    this.height,
    this.color = Colors.white,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
