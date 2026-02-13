import 'package:flutter/material.dart';
import '../../../framework/controller/base_screen/base_controller.dart';
import '../../../ui/utils/app_color.dart';

class BaseWeb extends StatefulWidget {
  const BaseWeb({super.key});

  @override
  State<BaseWeb> createState() => _BaseWebState();
}

class _BaseWebState extends State<BaseWeb> {
  late BaseController baseController;
  late int lastItem = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAppBar,
        leadingWidth: 120,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05),
          child: Image.asset('assets/images/ic_logo.png', width: 80),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: baseController.bottomNavigationList.map((item) {
            return InkWell(
              onTap: () {
                setState(() {
                  baseController.bottomNavigationList[lastItem].isSelected =
                      false;
                  item.isSelected = true;
                });
                lastItem = item.id;
              },

              child: Text(
                item.label,
                style: TextStyle(
                  fontWeight: item.isSelected
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: item.isSelected ? 15 : 14,
                ),
              ),
            );
          }).toList(),
        ),

        actions: [
          Icon(Icons.search),
          SizedBox(width: screenWidth * 0.006),
          Icon(Icons.notifications),
          SizedBox(width: screenWidth * 0.006),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(15),
              child: baseController.bottomNavigationList[lastItem].body
            ),

            Container(
              alignment: Alignment.center,
              width: screenWidth,
              height: 167,
              decoration: BoxDecoration(
                  color: colorBlack
              ),

              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.01,),
                  Flexible(child: Text("copyright © 2020-22 Dreamplug Technologies Pvt Ltd.", style: TextStyle(fontSize: 12, color: Colors.white,))),
                  Spacer(),
                  Flexible(child: Text("privacy policy | terms and conditions | returns and refund", style: TextStyle(fontSize: 12, color: Colors.white,))),
                  SizedBox(width: screenWidth * 0.01,),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    baseController = BaseController();
  }
}
