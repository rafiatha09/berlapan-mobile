import 'DonorDarah/main_donor_screen.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class DonorDarah extends StatelessWidget {
  const DonorDarah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donor Darah App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DonorDarahMainPage(),
    );
  }
}
