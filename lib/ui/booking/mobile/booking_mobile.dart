import 'package:actiday/framework/repositary/booking/booking.dart';
import 'package:actiday/ui/favourites/helper/common_grid_item.dart';
import 'package:actiday/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../detail/details_screen.dart';

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

  Future<void> loadData() async {
    final String response = await rootBundle.loadString(
      'assets/json/bookings.json',
    );

    final data = welcomeFromJson(response);

    setState(() {
      welcome = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorGrey
              ),
              child: TabBar(
                labelColor: colorPink,
                indicatorColor: colorPink,
                unselectedLabelColor: Colors.grey,
                dividerHeight: 0,
                tabs: const [
                  Tab(text: "Upcoming"),
                  Tab(text: "Past"),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: TabBarView(
                children: [
                  ListView.builder(
                  shrinkWrap: true,

                  itemCount: welcome?.upcoming?.length ?? 0,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CommonGridItem(
                        onButtonTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(modelGym: welcome?.upcoming![index])));
                        },
                        title: welcome?.upcoming?[index].title,
                        subTitle: welcome?.upcoming![index].subTitle?.join(
                            ' • '),
                        image: welcome?.upcoming?[index].image,
                        credit: welcome?.upcoming?[index].credit,
                        date: welcome?.upcoming?[index].date,
                        status: welcome?.upcoming?[index].status,
                      ),
                    );
                  }),
                  ListView.builder(
                      shrinkWrap: true,

                      itemCount: welcome?.past?.length ?? 0,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CommonGridItem(
                            onButtonTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(modelGym: welcome?.past![index])));
                            },
                            title: welcome?.past?[index].title,
                            subTitle: welcome?.past![index].subTitle?.join(
                                ' • '),
                            image: welcome?.past?[index].image,
                            credit: welcome?.past?[index].credit,
                            date: welcome?.past?[index].date,
                            status: welcome?.past?[index].status,
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

