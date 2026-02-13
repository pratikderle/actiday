import 'package:actiday/ui/favourites/helper/common_grid_item.dart';
import 'package:actiday/ui/home/helper/common_carousel.dart';
import 'package:actiday/ui/home/helper/common_category_item.dart';
import 'package:actiday/ui/utils/app_color.dart';
import 'package:actiday/ui/utils/widgets/common_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:actiday/framework/repositary/home/home.dart';

class HomeWebView extends StatefulWidget {
  const HomeWebView({super.key});

  @override
  State<HomeWebView> createState() => _HomeWebViewState();
}

class _HomeWebViewState extends State<HomeWebView> {
  @override
  void initState() {
    super.initState();
    loadBookingJson();
  }

  Future<void> loadBookingJson() async{
    final String response = await rootBundle.loadString('assets/json/home.json');

    final data = welcomeFromJson(response);

    setState(() {
      // print(data);
      home = data;
    });
  }
  Welcome? home;

  late int? topClassLength = home?.topClass?.length;

  @override
  Widget build(BuildContext context) {
    print(home?.topClass?.length);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonCarousel(),
          SizedBox(height: screenHeight * 0.03,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonBoldText(label: "Royal Peace Spa", size: 15),
              CommonBoldText(label: "Relax and rejuvenate with the traditional Thai dry therapy Relax and rejuvenate with the", size: 10, color: colorGrey,)
            ],
          ),
          SizedBox(height: screenHeight * 0.03,),
          CommonBoldText(label: "Categories", size: 15),

          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
              return CommonCategoryItem();
            }),
          ),

          SizedBox(height: screenHeight * 0.03,),
          CommonBoldText(label: "Top Classes", size: 15),

          GridView.builder(
            itemCount: home?.topClass?.length ?? 0,
            shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                childAspectRatio: 0.9
              ),
              itemBuilder: (BuildContext context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonGridItem(
                      modelTopClass: home!.topClass![index],
                    modelPast: null,
                  ),
                );
              })
        ],
    );
  }
}
