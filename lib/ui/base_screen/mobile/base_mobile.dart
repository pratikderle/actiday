import 'package:actiday/framework/controller/base_screen/base_controller.dart';
import 'package:actiday/ui/auth/login_screen.dart';
import 'package:actiday/ui/base_screen/base_screen.dart';
import 'package:actiday/ui/error/error_screen.dart';
import 'package:actiday/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class BaseMobile extends StatefulWidget {
  final int index;
  final Function(int) onChanged;
  final BaseController controller;

  const BaseMobile({
    super.key,
    required this.index,
    required this.onChanged,
    required this.controller,
  });

  @override
  State<BaseMobile> createState() => _BaseMobileState();
}

class _BaseMobileState extends State<BaseMobile> {
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
      drawer: Drawer(
        backgroundColor: colorWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                // Scaffold.of(context).closeDrawer();
                displayDialog();
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),

      // endDrawerEnableOpenDragGesture: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.grid_view),
            );
          },
        ),
        backgroundColor: colorWhite,

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
          child: widget.controller.bottomNavigationList[widget.index].body,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: widget.controller.bottomNavigationList.map((item) {
          return BottomNavigationBarItem(icon: item.myIcon, label: item.label);
        }).toList(),

        onTap: (index) {
          widget.onChanged(index);
        },

        currentIndex: widget.index,
        selectedItemColor: colorBlack,
        unselectedItemColor: colorGrey,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
