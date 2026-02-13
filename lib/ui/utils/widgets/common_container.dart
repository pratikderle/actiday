import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final Widget body;
  final double? height;
  final double? width;
  final Color? color;
  final double? borderradius;

  const CommonContainer({this.height, this.width, this.color, this.borderradius, required this.body, super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderradius ?? 20),
      ),
    );
  }
}
