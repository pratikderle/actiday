import 'package:actiday/framework/controller/base_screen/base_controller.dart';
import 'package:actiday/ui/error/error_screen.dart';
import 'package:actiday/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class BaseMobile extends StatefulWidget {
  final PreferredSizeWidget? bottom;
  const BaseMobile({super.key, this.bottom});

  @override
  State<BaseMobile> createState() => _BaseMobileState();
}

class _BaseMobileState extends State<BaseMobile> {
  late BaseController baseController;
  late int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.03),
          child: Icon(Icons.grid_view),
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined, size: 16),
            Text(
              " Abu Dhabi, UAE",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        actions: [
          Image.asset('assets/images/ic_notification.png'),
          SizedBox(width: screenWidth * 0.05),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          color: colorWhite,
          child:
              baseController.bottomNavigationList[currIndex].body
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: baseController.bottomNavigationList.map((item) {
          return BottomNavigationBarItem(icon: item.myIcon, label: item.label);
        }).toList(),

        onTap: (index) {
          setState(() {
            currIndex = index;
          });
        },

        currentIndex: currIndex,
        selectedItemColor: colorBlack,
        unselectedItemColor: colorGrey,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    baseController = BaseController();
  }
}
