import 'package:actiday/framework/repositary/base_screen/navigator_item.dart';
import 'package:actiday/ui/booking/booking_screen.dart';
import 'package:actiday/ui/booking/mobile/booking_mobile.dart';
import 'package:actiday/ui/error/error_screen.dart';
import 'package:actiday/ui/explore/explore_screen.dart';
import 'package:actiday/ui/explore/mobile/explore_mobile.dart';
import 'package:actiday/ui/favourites/favourites_screen.dart';
import 'package:actiday/ui/favourites/mobile/favourites_mobile.dart';
import 'package:actiday/ui/home/home_screen.dart';
import 'package:actiday/ui/home/mobile/home_mobile_view.dart';
import 'package:flutter/material.dart';

import '../../../ui/utils/app_constants.dart';

class BaseController {
  List<NavigationItem> bottomNavigationList = [
    NavigationItem(
      id: 0,
      label: EnumBottomNavigationItems.home.name,
      myIcon: Icon(Icons.home),
      body: HomeScreen(),
      isSelected: true,
    ),
    NavigationItem(
      id: 1,
      label: EnumBottomNavigationItems.booking.name,
      myIcon: Icon(Icons.bookmark_border),
      body: BookingScreen(),

    ),
    NavigationItem(
      id: 2,
      label: EnumBottomNavigationItems.explore.name,
      myIcon: Icon(Icons.explore),
      body: ExploreScreen(),
    ),
    NavigationItem(
      id: 3,
      label: EnumBottomNavigationItems.favourite.name,
      myIcon: Icon(Icons.favorite),
      body: FavouritesScreen(),
    ),
  ];

  Widget displayBody(int index) {
    for (var element in bottomNavigationList) {
      if (element.id == index) return element.body;
    }
    return ErrorScreen();
  }
}
