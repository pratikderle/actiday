import 'package:actiday/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
class CommonCategoryItem extends StatefulWidget {
  const CommonCategoryItem({super.key});

  @override
  State<CommonCategoryItem> createState() => _CommonCategoryItemState();
}

class _CommonCategoryItemState extends State<CommonCategoryItem> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20),
      child: Container(
        height: 150,
        width: screenSize.width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorPink,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
          child: Stack(
            children: [
              Positioned(
                  left: 1,
                  top: 1,
                  child: Text("Spa & Beauty", style: TextStyle(fontSize: 20, color: colorWhite, fontWeight: FontWeight.bold),)
              ),
              Positioned(
                  right: 1,
                  bottom: 0,
                  child: Image.asset('assets/images/ic_girl_skincare.png'))
            ],
          )
        ),
      ),
    );
  }
}
