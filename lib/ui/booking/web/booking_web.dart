import 'package:actiday/ui/detail/details_screen.dart';
import 'package:actiday/ui/utils/app_color.dart';
import 'package:actiday/ui/utils/widgets/common_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../framework/repositary/booking/booking.dart';
import '../../favourites/helper/common_grid_item.dart';

class BookingWeb extends StatefulWidget {
  const BookingWeb({super.key});

  @override
  State<BookingWeb> createState() => _BookingWebState();
}

class _BookingWebState extends State<BookingWeb> {
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
            CommonBoldText(label: "Booking", size: 15),
            Container(
              width: 200,
              decoration: BoxDecoration(
                // color: colorGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                labelColor: colorPink,
                indicatorColor: colorPink,
                unselectedLabelColor: Colors.grey,
                dividerColor: Colors.transparent,

                tabs: const [
                  Tab(text: "Upcoming"),
                  Tab(text: "Past"),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 800
                          ? 3
                          : 2,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: welcome?.past?.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonGridItem(
                          onButtonTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(modelGym: welcome?.upcoming![index])));
                          },
                          title: welcome?.upcoming?[index].title,
                          subTitle: welcome?.upcoming![index].subTitle?.join(
                            ' • ',
                          ),
                          image: welcome?.upcoming?[index].image,
                          credit: welcome?.upcoming?[index].credit,
                          date: welcome?.upcoming?[index].date,
                          status: welcome?.upcoming?[index].status,
                        ),
                      );
                    },
                  ),

                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 800
                          ? 3
                          : 2,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: welcome?.past?.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonGridItem(
                          onButtonTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(modelGym: welcome?.past![index])));
                          },
                          title: welcome?.past?[index].title,
                          subTitle: welcome?.past![index].subTitle?.join(
                            ' • ',
                          ),
                          image: welcome?.past?[index].image,
                          credit: welcome?.past?[index].credit,
                          date: welcome?.past?[index].date,
                          status: welcome?.past?[index].status,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
