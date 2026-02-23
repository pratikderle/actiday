import 'package:actiday/ui/base_screen/web/base_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../framework/controller/base_screen/base_controller.dart';
import 'mobile/base_mobile.dart';

class BaseScreen extends StatefulWidget {
  final int? passedIndex;
  const BaseScreen({super.key, this.passedIndex});


  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  static int currIndex = 0;
  late BaseController baseController;

  @override
  void initState() {
    super.initState();
    baseController = BaseController();
  }

  void onIndexChanged(int index) {
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => BaseMobile(
        index: currIndex,
        onChanged: onIndexChanged,
        controller: baseController,
      ),
      desktop: (context) => BaseWeb(
        index: currIndex,
        onChanged: onIndexChanged,
        controller: baseController,
      ),
      tablet: (BuildContext context) {
        return OrientationBuilder(
          builder: (BuildContext context, orientation) {
            return orientation == Orientation.landscape
                ? BaseWeb(
                    index: currIndex,
                    onChanged: onIndexChanged,
                    controller: baseController,
                  )
                : BaseMobile(
                    index: currIndex,
                    onChanged: onIndexChanged,
                    controller: baseController,
                  );
          },
        );
      },
    );
  }
}
