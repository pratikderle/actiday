import 'package:flutter/material.dart';

import '../../base_screen/base_screen.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> BaseScreen()));
      }, child: Text("Login")),
    );
  }
}
