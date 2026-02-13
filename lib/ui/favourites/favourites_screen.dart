import 'package:actiday/ui/favourites/mobile/favourites_mobile.dart';
import 'package:actiday/ui/favourites/web/favourites_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => FavouritesMobile(),
      desktop: (context) => FavouritesWeb(),
      tablet: (context) {
        return OrientationBuilder(
            builder: (context, orientation){
              return orientation == Orientation.landscape ? FavouritesMobile() : FavouritesWeb();
            }
            );
      },
    );
  }
}
