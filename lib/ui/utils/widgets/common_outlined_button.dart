import 'package:actiday/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class CommonOutlinedButton extends StatefulWidget {
  final String label;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final Gradient? gradient;
  final bool? enableBorder;
  const CommonOutlinedButton({super.key, required this.label, this.enableBorder, this.backgroundColor, this.borderColor, this.textColor, this.height, this.width, this.gradient});

  @override
  State<CommonOutlinedButton> createState() => _CommonOutlinedButtonState();
}

class _CommonOutlinedButtonState extends State<CommonOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Ink(
        child: Container(
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: widget.gradient,
            borderRadius: BorderRadius.circular(20),
            border: widget.enableBorder ?? false ? Border.all(color: widget.borderColor ?? colorBlack) : null,
            // boxShadow: [
            //   BoxShadow(
            //
            //   )
            // ]
          ),
          child: Text(widget.label, style: TextStyle(color: widget.textColor),),
        ),
      )
    );
  }
}
