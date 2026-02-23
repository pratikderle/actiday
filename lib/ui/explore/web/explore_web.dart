import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/widgets/common_bold_text.dart';

class ExploreWeb extends StatefulWidget {
  const ExploreWeb({super.key});

  @override
  State<ExploreWeb> createState() => _ExploreWebState();
}

class _ExploreWebState extends State<ExploreWeb> {
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
