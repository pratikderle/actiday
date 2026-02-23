import 'package:actiday/ui/utils/app_constants.dart';
import 'package:actiday/ui/utils/widgets/common_bold_text.dart';
import 'package:flutter/material.dart';

import '../helper/common_grid_item.dart';

class FavouritesMobile extends StatefulWidget {
  const FavouritesMobile({super.key});

  @override
  State<FavouritesMobile> createState() => _FavouritesMobileState();
}

class _FavouritesMobileState extends State<FavouritesMobile> {
  @override
  Widget build(BuildContext context) {
    print(listFavourites);
    return listFavourites.isNotEmpty? ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listFavourites.length,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: CommonGridItem(
            onMyTap: (){
              listFavourites.removeAt(index);
              setState(() {

              });
            },
            title: listFavourites[index].title,
            subTitle: listFavourites[index].subTitle,
            image: listFavourites[index].image,
            address: listFavourites[index].distance,
            isFavourite: listFavourites[index].isFavourite,
            distance: listFavourites[index].distance,
          ),
        );
      },
    ) : SizedBox(height: MediaQuery.of(context).size.height, child: Center(child: CommonBoldText(label: "Empty List", size: 15),));
  }
}
