import 'package:actiday/ui/splash/helper/common_splash_image.dart';
import 'package:flutter/material.dart';

import '../../base_screen/base_screen.dart';
class SplashWeb extends StatefulWidget {
  const SplashWeb({super.key});

  @override
  State<SplashWeb> createState() => _SplashWebState();
}

class _SplashWebState extends State<SplashWeb> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BaseScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CommonSplashImage(),
      ),
    );
  }
}
