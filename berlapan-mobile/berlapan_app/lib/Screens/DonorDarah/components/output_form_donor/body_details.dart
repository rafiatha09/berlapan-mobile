import 'package:berlapan_app/Screens/DonorDarah/api/api.dart';
import 'package:flutter/material.dart';
import 'package:berlapan_app/constants/constants.dart';
import 'package:berlapan_app/Screens/DonorDarah/components/output_form_donor/result_details.dart';
import 'package:provider/provider.dart';

class DetailsForm extends StatefulWidget {
  const DetailsForm({Key? key}) : super(key: key);

  @override
  _DetailsFormState createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final donorP = Provider.of<DonorDataProvider>(context);

    var index = 1;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.15),
                  padding: EdgeInsets.only(
                    top: size.height * 0.05,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      // Expanded(
                      //   child: SizedBox(
                      //       height: 200,
                      //       child: ListView.builder(
                      //         itemCount: donorP.donordata.length,
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return ResultDetails(donorP.donordata[index]);
                      //         },
                      //       )),
                      // )
                      ResultDetails(donor: donorP.donordata[0]),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: kDefaultPadding),
                        Text(
                          "Selamat!",
                          style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Anda telah terdaftar sebagai relawan donor darah.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
