import 'package:actiday/ui/utils/app_color.dart';
import 'package:actiday/ui/utils/widgets/common_bold_text.dart';
import 'package:flutter/material.dart';

class ExploreMobile extends StatefulWidget {
  const ExploreMobile({super.key});

  @override
  State<ExploreMobile> createState() => _ExploreMobileState();
}

class _ExploreMobileState extends State<ExploreMobile> {
  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(Icons.location_on, size: 40,),
          title: Column(
            children: [
              CommonBoldText(label: "Explore More", size: 13),
              Text(
                "We Need Location access To Find the Nearest Gym/ Spa Around You",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
          actions: [
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size(200, 40)),
                  ),
                  child: Text("Cancel"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size(200, 40)),
                    backgroundColor: WidgetStatePropertyAll(colorPink),
                  ),
                  child: Text("Enable"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(onPressed: displayDialog, icon: Icon(Icons.touch_app)),
    );
  }
}
