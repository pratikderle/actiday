import 'package:actiday/ui/favourites/helper/common_grid_item.dart';
import 'package:actiday/ui/home/helper/common_carousel.dart';
import 'package:actiday/ui/home/helper/common_category_item.dart';
import 'package:actiday/ui/home/helper/common_search_bar.dart';
import 'package:actiday/ui/utils/widgets/common_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../framework/repositary/home/home.dart';
import '../../utils/app_constants.dart';
import 'package:collection/collection.dart';

class HomeMobileView extends StatefulWidget {
  const HomeMobileView({super.key});

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView> {
  Welcome? welcome;
  List<TopClass>? listTopClass;

  @override
  void initState() {
    super.initState();
    loadData();
    listTopClass = listFavourites;
  }

  Future<void> loadData() async {
    final String response = await rootBundle.loadString(
      'assets/json/home.json',
    );
    final data = welcomeFromJson(response);

    setState(() {
      welcome = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonSearchBar(),
          CommonCarousel(showCarouselIndicator: false),
          CommonBoldText(label: "Active Lifestyle", size: 14),
          Text(
            "Get active every day Try new things \nFind new classes",
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CommonCategoryItem();
              },
            ),
          ),

          SizedBox(height: 20),
          CommonBoldText(label: "Top Classes", size: 14),
          SizedBox(height: 20),
          GridView.builder(
            itemCount: welcome?.topClass?.length ?? 0,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonGridItem(
                  // key: ValueKey('${welcome?.topClass?[index].id}_${listTopClass?.any((e) => e.id == welcome?.topClass?[index].id)}'),
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
                        print("Removed");

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
      ),
    );
  }
}
