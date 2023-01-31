import 'package:flutter/material.dart';
import 'package:berlapan_app/components/rounded_button.dart';
import 'package:berlapan_app/Screens/Welcome/components/background.dart';
import 'package:berlapan_app/Screens/Login/login_screen.dart';
import 'package:berlapan_app/Screens/Signup/signup_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
