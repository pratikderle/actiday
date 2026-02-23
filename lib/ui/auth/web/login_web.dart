import 'package:actiday/ui/base_screen/base_screen.dart';
import 'package:flutter/material.dart';

class LoginWeb extends StatefulWidget {
  const LoginWeb({super.key});

  @override
  State<LoginWeb> createState() => _LoginWebState();
}

class _LoginWebState extends State<LoginWeb> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> BaseScreen()));
      }, child: Text("Login")),
    );
  }
}
