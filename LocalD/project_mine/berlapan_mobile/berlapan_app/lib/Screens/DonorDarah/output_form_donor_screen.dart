import 'api/api.dart';
import 'package:berlapan_app/Screens/DonorDarah/components/output_form_donor/result_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OutputFormDonorPage extends StatelessWidget {
  const OutputFormDonorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DonorDataProvider(),
      child: MaterialApp(
        title: 'Hasil Pendaftaran Donor Darah',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ResultForm(),
      ),
    );
  }
}
