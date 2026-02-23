import 'package:actiday/ui/detail/details_screen.dart';
import 'package:flutter/material.dart';

import '../app_color.dart';

class CommonGradientButton extends StatefulWidget {
  final int? id;
  final String? label;
  final double? width;
  final double? height;
  final Color? colorBackground;
  final GestureTapCallback? onTap;

  const CommonGradientButton({
    super.key,
    this.width,
    this.height,
    this.colorBackground,
    this.label,
    this.id,
    this.onTap,
  });

  @override
  State<CommonGradientButton> createState() => _CommonGradientButtonState();
}

class _CommonGradientButtonState extends State<CommonGradientButton> {
  bool? isClick = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Ink(
        child: Container(
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient:
                DetailsScreen.ratingIndex >= num.parse(widget.id.toString())
                ? LinearGradient(
                    colors: [
                      Color(0xffFEC34D),
                      Color(0xffF88C83),
                      Color(0xffF25CB2),
                      Color(0xffF048C6),
                    ],
                  )
                : LinearGradient(
                    colors: [Color(0x2f000000), Color(0x2f000000)],
                  ),
          ),
          padding: EdgeInsets.all(2),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DetailsScreen.ratingIndex == num.parse(widget.id.toString())
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.id.toString(),
                        style: TextStyle(color: colorPink),
                      ),
                      Icon(Icons.star, color: colorPink, size: 18),
                    ],
                  )
                : DetailsScreen.ratingIndex <= num.parse(widget.id.toString())
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.id.toString(),
                        style: TextStyle(color: Color(0x3f000000)),
                      ),
                      Icon(Icons.star, color: Color(0x3f000000), size: 18),
                    ],
                  )
                : Row(),
          ),
        ),
      ),
    );
  }
}
