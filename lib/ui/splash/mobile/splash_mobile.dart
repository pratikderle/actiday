import 'package:actiday/ui/base_screen/base_screen.dart';
import 'package:flutter/material.dart';

import '../helper/common_splash_image.dart';

class SplashMobile extends StatefulWidget {
  const SplashMobile({super.key});

  @override
  State<SplashMobile> createState() => _SplashMobileState();
}

class _SplashMobileState extends State<SplashMobile> {
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