import 'package:actiday/ui/favourites/helper/common_grid_item.dart';
import 'package:actiday/ui/home/helper/common_carousel.dart';
import 'package:actiday/ui/home/helper/common_category_item.dart';
import 'package:actiday/ui/home/helper/common_search_bar.dart';
import 'package:actiday/ui/utils/widgets/common_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../framework/repositary/home/home.dart';

class HomeMobileView extends StatefulWidget {
  const HomeMobileView({super.key});

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView> {
  Welcome? welcome;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async{
    final String response = await rootBundle.loadString('assets/json/home.json');
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
          CommonCarousel(showCarouselIndicator: false,),
          CommonBoldText(label: "Active Lifestyle", size: 14),
          Text("Get active every day Try new things \nFind new classes", style: TextStyle(fontSize: 12),),
          SizedBox(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
              return CommonCategoryItem();
            }),
          ),

          SizedBox(height: 20,),
          CommonBoldText(label: "Top Classes", size: 14),
          SizedBox(height: 20,),
          GridView.builder(
              itemCount: welcome?.topClass?.length ?? 0,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.1
              ),
              itemBuilder: (BuildContext context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonGridItem(modelTopClass:
                    welcome!.topClass![index],
                    modelPast: null,
                  ),
                );
              })
        ],
      ),
    );
  }
}
