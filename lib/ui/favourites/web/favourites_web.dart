import 'package:actiday/ui/favourites/helper/common_grid_item.dart';
import 'package:flutter/material.dart';


class FavouritesWeb extends StatefulWidget {
  const FavouritesWeb({super.key});

  @override
  State<FavouritesWeb> createState() => _FavouritesWebState();
}

class _FavouritesWebState extends State<FavouritesWeb> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.7
          ),
          itemBuilder: (BuildContext context, index){
            return ;
          },
          itemCount: 9,),
      ],
    );
  }
}
