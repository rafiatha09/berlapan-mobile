import 'package:flutter/material.dart';
import 'package:berlapan_app/components/rounded_button.dart';
import 'package:berlapan_app/Screens/Login/login_screen.dart';
import 'package:berlapan_app/Screens/Signup/signup_screen.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/images/berlapan_logo.png',
            height: 99.0,
            width: 100.0,
          ),
        ),
        body: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              child,
              Container(
                child: Stack(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/background_center.png'),
                      height: size.height * 0.7,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Bersatu Kita Teguh Bercerai Kita Runtuh',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              color: Colors.greenAccent,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Dengan berlapan, kamu bisa membantu masyarakat di sekitar lingkungan kamu yang sedang kesulitan di masa pandemi COVID-19 ini.',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 30,),
                          RoundedButton(
                            text: 'LOGIN',
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return LoginScreen();
                                }),
                              );
                            },
                          ),
                          // SizedBox(height: 20,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/images/main_bottom.png',
                  width: size.width,
                ),
              ),
              RoundedButton(
                text: 'SIGN UP',
                color: Colors.white,
                textColor: Colors.black,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
