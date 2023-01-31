import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:berlapan_app/Screens/Login/components/background.dart';
import 'package:berlapan_app/Screens/Signup/signup_screen.dart';
import 'package:berlapan_app/components/have_an_acc.dart';
import 'package:berlapan_app/components/rounded_button.dart';
import 'package:berlapan_app/components/rounded_input_field.dart';
import 'package:berlapan_app/components/rounded_pass_field.dart';

import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _loginFromKey = GlobalKey<FormState>();

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'LOGIN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: 'Username',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'LOGIN',
              press: () async {
                if (_loginFromKey.currentState!.validate()) {
                  final response = await http.post(
                      Uri.parse("http://berlapan.herokuapp.com/json"),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8'
                      },
                      body: jsonEncode(<String, String>{
                        'Username': username,
                        'Password': password,
                      }));
                  print(response);
                  print(response.body);
                } else {
                  print('Akun anda tidak valid');
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
// class Body extends StatelessWidget {
//   const Body({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "LOGIN",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25,
//                 fontFamily: 'Montserrat',
//               ),
//             ),
//             SizedBox(height: size.height * 0.03),
//             RoundedInputField(
//               hintText: "Your Email",
//               onChanged: (value) {},
//             ),
//             RoundedPasswordField(
//               onChanged: (value) {},
//             ),
//             RoundedButton(
//               text: "LOGIN",
//               press: () async {
//                 if()
//               },
//             ),
//             SizedBox(height: size.height * 0.03),
//             AlreadyHaveAnAccountCheck(
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return SignUpScreen();
//                     },
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
