import 'package:actiday/ui/favourites/helper/common_grid_item.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/widgets/common_bold_text.dart';


class FavouritesWeb extends StatefulWidget {
  const FavouritesWeb({super.key});

  @override
  State<FavouritesWeb> createState() => _FavouritesWebState();
}

class _FavouritesWebState extends State<FavouritesWeb> {
  @override
  Widget build(BuildContext context) {
    return listFavourites.isNotEmpty? GridView.builder(
      itemCount: listFavourites.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1
      ),
      itemBuilder: (BuildContext context, index){
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
            address: listFavourites[index].address,
            isFavourite: listFavourites[index].isFavourite,
            distance: listFavourites[index].distance,
            rating: listFavourites[index].rating,
          ),
        );
      },
        ): SizedBox(height: MediaQuery.of(context).size.height, child: Center(child: CommonBoldText(label: "Empty List", size: 15),));
  }
}
