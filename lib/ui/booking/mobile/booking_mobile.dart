import 'package:actiday/framework/repositary/booking/booking.dart';
import 'package:actiday/ui/favourites/helper/common_grid_item.dart';
import 'package:actiday/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingMobile extends StatefulWidget {
  const BookingMobile({super.key});

  @override
  State<BookingMobile> createState() => _BookingMobileState();
}

class _BookingMobileState extends State<BookingMobile> {
  Welcome? welcome;

  @override
  void initState() {
    super.initState();
    loadData();
  }


  Future<void> loadData() async{
    final String response = await rootBundle.loadString('assets/json/bookings.json');

    final data = welcomeFromJson(response);

    setState(() {
      welcome = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("-----------${welcome} \n ${welcome?.upcoming}  ? \n ${welcome
    //     ?.upcoming?[0].title}");

    // print("_---> ${welcome?.upcoming}");
    return  SizedBox(
      height: 200,
      child: DefaultTabController(
          length: 2, // Number of tabs
          child: Scaffold(
            body: TabBarView(
              children: [
                // Tab 1: List of TopClass cards
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: 2,
                  itemBuilder: (context, index) => CommonGridItem(
                      modelPast: welcome?.upcoming?[index],
                  modelTopClass: null,),
                ),
                // Tab 2: List of Past cards
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: 2,
                  itemBuilder: (context, index) => CommonGridItem(
                      modelPast: welcome?.past?[index],
                  modelTopClass: null,),
                ),
              ],
            ),
          )
      )
    );
    }
}
