import 'package:actiday/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class CommonBoldText extends StatefulWidget {
  final String label;
  final double size;
  final Color? color;
  const CommonBoldText({super.key, this.color, required this.label, required this.size});

  @override
  State<CommonBoldText> createState() => _CommonBoldTextState();
}

class _CommonBoldTextState extends State<CommonBoldText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: widget.size, color: widget.color ?? colorBlack),);
  }
}
