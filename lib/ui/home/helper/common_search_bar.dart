import 'package:actiday/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class CommonSearchBar extends StatefulWidget {
  const CommonSearchBar({super.key});

  @override
  State<CommonSearchBar> createState() => _CommonSearchBarState();
}

class _CommonSearchBarState extends State<CommonSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(10),
      ),

      child: TextField(
        cursorColor: colorBlack,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide(color: colorBlack),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x1f000000)),
            borderRadius: BorderRadius.circular(13),
          ),
          hintStyle: TextStyle(color: colorBlack),
          hintText: "yoga, pilates, massage",
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
