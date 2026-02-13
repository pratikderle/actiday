import 'package:flutter/material.dart';

import '../../../ui/utils/app_color.dart';

class CommonAppbar extends StatefulWidget {
  const CommonAppbar({super.key});

  @override
  State<CommonAppbar> createState() => _CommonAppbarState();
}

class _CommonAppbarState extends State<CommonAppbar> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textStyle = TextStyle(fontSize: 14,);
    return AppBar(
      backgroundColor: colorAppBar,
      leadingWidth: 120,
      leading: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.05),
        child: Image.asset('assets/images/ic_logo.png', width: 80,),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Text("Home", style: textStyle,),
          Text("Bookings", style: textStyle,),
          Text("Explore", style: textStyle,),
          Text("Favourite", style: textStyle,)
        ],
      ),
      actions: [
        Icon(Icons.search),
        SizedBox(width: screenWidth * 0.006,),
        Icon(Icons.notifications),
        SizedBox(width: screenWidth * 0.006,),
        Container(
          height: 20,
          width:20,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            shape: BoxShape.circle
          ),
        ),
        SizedBox(width: screenWidth * 0.04,),
      ],
    );
  }
}
