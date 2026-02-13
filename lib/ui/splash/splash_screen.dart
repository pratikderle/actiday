import 'package:actiday/ui/splash/helper/common_splash_image.dart';
import 'package:actiday/ui/splash/mobile/splash_mobile.dart';
import 'package:actiday/ui/splash/web/splash_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => SplashMobile(),
      desktop: (context) => SplashWeb(),
      tablet: (BuildContext context){
        return OrientationBuilder(builder: (context, orientation){
          return orientation == Orientation.landscape ? SplashMobile() : SplashWeb();
        }
        );
      },
    );
  }
}
