import 'package:actiday/ui/home/mobile/home_mobile_view.dart';
import 'package:actiday/ui/home/web/home_web_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const HomeMobileView(),

      desktop: (BuildContext context) => const HomeWebView(),

      tablet: (BuildContext context){
        return OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.landscape ? HomeMobileView() : HomeWebView();
        },
        );
      },
    );
  }
}
