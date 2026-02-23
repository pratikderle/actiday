import 'package:actiday/ui/favourites/helper/common_grid_item.dart';
import 'package:actiday/ui/home/helper/common_carousel.dart';
import 'package:actiday/ui/home/helper/common_category_item.dart';
import 'package:actiday/ui/utils/app_color.dart';
import 'package:actiday/ui/utils/widgets/common_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:actiday/framework/repositary/home/home.dart';

import '../../utils/app_constants.dart';

class HomeWebView extends StatefulWidget {
  const HomeWebView({super.key});

  @override
  State<HomeWebView> createState() => _HomeWebViewState();
}

class _HomeWebViewState extends State<HomeWebView> {
  List<TopClass>? listTopClass;
  @override
  void initState() {
    super.initState();
    loadBookingJson();
    listTopClass = listFavourites;
  }

  Future<void> loadBookingJson() async {
    final String response = await rootBundle.loadString(
      'assets/json/home.json',
    );

    final data = welcomeFromJson(response);

    setState(() {
      // print(data);
      welcome = data;
    });
  }

  Welcome? welcome;

  late int? topClassLength = welcome?.topClass?.length;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonCarousel(),
        SizedBox(height: screenHeight * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonBoldText(label: "Royal Peace Spa", size: 15),
            CommonBoldText(
              label:
                  "Relax and rejuvenate with the traditional Thai dry therapy Relax and rejuvenate with the",
              size: 14,
              color: colorGrey,
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.03),
        CommonBoldText(label: "Categories", size: 15),

        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CommonCategoryItem();
            },
          ),
        ),

        SizedBox(height: screenHeight * 0.03),
        CommonBoldText(label: "Top Classes", size: 15),

        GridView.builder(
          itemCount: welcome?.topClass?.length ?? 0,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: screenWidth< 800? 0.85 : 1,
          ),
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonGridItem(
                onMyTap: () {
                  setState(() {
                    final item = welcome?.topClass?[index];
                    if (item == null) return;

                    final existingIndex = listTopClass?.indexWhere((element) => element.id == item.id) ?? -1;

                    if (existingIndex == -1) {
                      listTopClass?.add(TopClass(
                        id: item.id,
                        title: item.title,
                        subTitle: item.subTitle,
                        image: item.image,
                        isFavourite: true,
                        address: item.address,
                        rating: item.rating,
                        distance: item.distance,
                      ));
                    } else {
                      listTopClass?.removeAt(existingIndex);

                    }
                    item.isFavourite = !(item.isFavourite ?? false);

                  });

                },

                title: welcome?.topClass?[index].title,
                subTitle: welcome?.topClass?[index].subTitle,
                image: welcome?.topClass?[index].image,
                address: welcome?.topClass?[index].address,
                rating: welcome?.topClass?[index].rating,
                isFavourite: listTopClass?.any((element) => element.id == welcome?.topClass?[index].id) ?? false,
              ),
            );
          },
        ),
      ],
    );
  }
}
