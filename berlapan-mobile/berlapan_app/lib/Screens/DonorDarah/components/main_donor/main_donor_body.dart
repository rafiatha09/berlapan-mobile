import 'package:flutter/material.dart';
import 'package:berlapan_app/constants/constants.dart';
import 'package:berlapan_app/Screens/DonorDarah/form_donor_screen.dart';

import 'mengapa_donor.dart';
import 'header_searchbox.dart';
import 'nama_layanan.dart';
import 'title_bbtn.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(
              title: "Layanan Donor Darah",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormDonorDarahPage()),
                );
              }),
          NamaLayanan(),
          TitleWithoutButton(title: "Mengapa Donor Darah?"),
          MengapaDonorDarah(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
