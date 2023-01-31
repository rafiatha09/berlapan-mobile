import 'package:flutter/material.dart';
import 'package:berlapan_app/Screens/Login/login_screen.dart';
import 'package:berlapan_app/Screens/Signup/components/background.dart';
// import 'package:berlapan_app/Screens/Signup/components/or_divider.dart';
// import 'package:berlapan_app/Screens/Signup/components/social_icon.dart';
import 'package:berlapan_app/components/have_an_acc.dart';
import 'package:berlapan_app/components/rounded_button.dart';
import 'package:berlapan_app/components/rounded_input_field.dart';
import 'package:berlapan_app/components/rounded_pass_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SIGNUP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: 'Full Name', 
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: 'Username', 
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: 'NIK',
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: 'Your Email',
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: 'Location',
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: 'Birthdate',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'SIGNUP',
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
