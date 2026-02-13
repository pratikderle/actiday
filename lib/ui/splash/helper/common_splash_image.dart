import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonSplashImage extends StatelessWidget {
  const CommonSplashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/ic_splash_icon.svg', width: 400, height: 400,);
  }
}
