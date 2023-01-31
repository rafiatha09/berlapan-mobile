import 'package:flutter/material.dart';
import 'package:berlapan_app/constants/constants.dart';
import 'package:berlapan_app/Screens/DonorDarah/components/output_form_donor/body_details.dart';

class ResultForm extends StatelessWidget {
  const ResultForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: DetailsForm(),
    );
  }
}
