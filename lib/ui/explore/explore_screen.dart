import 'package:actiday/ui/explore/mobile/explore_mobile.dart';
import 'package:actiday/ui/explore/web/explore_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => ExploreMobile(),
      desktop: (context) => ExploreWeb(),
      tablet: (context) {
        return OrientationBuilder(
            builder: (context, orientation){
              return orientation == Orientation.landscape ? ExploreMobile() : ExploreWeb();
            }
        );
      },
    );
  }
}
