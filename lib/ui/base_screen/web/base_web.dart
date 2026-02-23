import 'package:actiday/ui/auth/login_screen.dart';
import 'package:actiday/ui/profile/web/profile_web.dart';
import 'package:flutter/material.dart';
import '../../../framework/controller/base_screen/base_controller.dart';
import '../../../ui/utils/app_color.dart';
import '../base_screen.dart';

class BaseWeb extends StatefulWidget {
  final int index;
  final Function(int) onChanged;
  final BaseController controller;

  const BaseWeb({
    super.key,
    required this.index,
    required this.onChanged,
    required this.controller,
  });

  @override
  State<BaseWeb> createState() => _BaseWebState();
}

class _BaseWebState extends State<BaseWeb> {
  OverlayPortalController overlayPortalController = OverlayPortalController();

  void displayDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(Icons.warning, size: 35, color: Colors.red,),
          title: Text("Are you sure? Do you want to log out", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false,
                );
              },
              child: Text("LogOut"),
            ),
          ],
        );
      },
    );
  }

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
          children: widget.controller.bottomNavigationList.map((item) {
            final bool isSelected = item.id == widget.index;
            return InkWell(
              onTap: () {
                widget.onChanged(item.id);
              },

              child: Text(
                item.label,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: isSelected ? 15 : 14,
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
          SizedBox(width: screenWidth * 0.006),
          IconButton(onPressed: (){
            displayDialog();
          }, icon: Icon(Icons.logout)),

          SizedBox(width: screenWidth * 0.04),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: widget.controller.bottomNavigationList[widget.index].body,
            ),

            Container(
              alignment: Alignment.center,
              width: screenWidth,
              height: 167,
              decoration: BoxDecoration(color: colorBlack),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: screenWidth * 0.01),
                  Flexible(
                    child: Text(
                      "copyright © 2020-22 Dreamplug Technologies Pvt Ltd.",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    child: Text(
                      "privacy policy | terms and conditions | returns and refund",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
