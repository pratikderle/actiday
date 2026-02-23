import 'package:actiday/framework/repositary/booking/booking.dart';
import 'package:actiday/ui/base_screen/base_screen.dart';
import 'package:actiday/ui/detail/mobile/details_mobile.dart';
import 'package:actiday/ui/detail/web/details_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../framework/controller/base_screen/base_controller.dart';

class DetailsScreen extends StatefulWidget {
  static String rating = '';
  static int ratingIndex = 6;
  final Past? modelGym;
  static List<String> qualityLabels = [
    'Poor',
    'Below Average',
    'Average',
    'Good',
    'Excellent',
    ''
  ];
  const DetailsScreen({super.key, required this.modelGym});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late BaseController baseController;

  @override
  void initState() {
    super.initState();
    baseController = BaseController();
  }

  void onIndexChanged(int index) {
    setState(() {
      // _BaseScreenState = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => DetailsMobile(modelGym: widget.modelGym,),
      desktop: (context) => DetailsWeb(modelGym: widget.modelGym),
      tablet: (context) {
        return OrientationBuilder(builder: (context, orientation){
          return orientation == Orientation.landscape ? DetailsWeb(modelGym: widget.modelGym) : DetailsMobile(modelGym: widget.modelGym);
        });
      },
    );
  }
}
