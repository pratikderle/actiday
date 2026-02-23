import 'package:actiday/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
class ProfileWeb extends StatefulWidget {
  const ProfileWeb({super.key});

  @override
  State<ProfileWeb> createState() => _ProfileWebState();
}

class _ProfileWebState extends State<ProfileWeb> {
  @override
  Widget build(BuildContext context) {
    return Overlay(
      clipBehavior: Clip.antiAlias,
      initialEntries: [
        OverlayEntry(builder: (BuildContext context){
          return Icon(Icons.eighteen_mp, color: colorPink,);
        })
      ],
    );
  }
}
