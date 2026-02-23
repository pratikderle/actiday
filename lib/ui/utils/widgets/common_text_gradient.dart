import 'package:actiday/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class CommonTextGradient extends StatefulWidget {
  final double? width;
  final double? height;
  const CommonTextGradient({super.key, this.width, this.height});

  @override
  State<CommonTextGradient> createState() => _CommonTextGradientState();
}

class _CommonTextGradientState extends State<CommonTextGradient> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Color(0xffFEC34D),
            Color(0xffF88C83),
            Color(0xffF25CB2),
            Color(0xffF048C6),
          ],
        ),
      ),
      padding: EdgeInsets.all(2),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(

          maxLength: 1,
          decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // hintText: "Enter text",
          ),
        )
      ),
    );
  }
}
