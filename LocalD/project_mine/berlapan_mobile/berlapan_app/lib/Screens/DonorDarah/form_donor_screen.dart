import 'api/api.dart';
import 'package:flutter/material.dart';
import 'package:berlapan_app/Screens/DonorDarah/components/form_donor/form.dart';
import 'package:provider/provider.dart';

class FormDonorDarahPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DonorDataProvider(),
      child: MaterialApp(
        title: 'Formulir Donor Darah',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FormDonor(),
      ),
    );
  }
}
