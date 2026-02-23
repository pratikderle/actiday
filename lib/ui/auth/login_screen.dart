import 'package:actiday/ui/auth/mobile/login_mobile.dart';
import 'package:actiday/ui/auth/web/login_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => LoginMobile(),
      desktop: (context) => LoginWeb(),
      tablet: (context){
        return OrientationBuilder(builder: (context, orientation){
          return orientation == Orientation.landscape ? LoginWeb() : LoginMobile();
        });
      },
    );
  }
}
