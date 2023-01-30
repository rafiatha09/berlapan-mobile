import 'package:berlapan_app/Screens/DonorDarah/models/donor_data.dart';
import 'package:flutter/material.dart';
import 'package:berlapan_app/constants/constants.dart';

class ResultDetails extends StatelessWidget {
  const ResultDetails({Key? key, required this.donor}) : super(key: key);

  final DonorData donor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hasil Pendaftaran",
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                "Data Diri",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: kPrimaryColor.withOpacity(0.8),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Result(title: "Nama Lengkap", result: donor.nama),
              const SizedBox(height: 10),
              Result(title: "NIK", result: donor.nik),
              const SizedBox(height: 10),
              Result(title: "Tanggal Lahir", result: donor.tglLahir),
              const SizedBox(height: 25),
              Text(
                "Data Relawan Donor Darah",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: kPrimaryColor.withOpacity(0.8),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Result(title: "Golongan Darah", result: donor.goldar),
              const SizedBox(height: 10),
              Result(
                  title: "Sentra Layanan Golongan Darah",
                  result: donor.sentra
              ),
              const SizedBox(height: 10),
              Result(title: "Waktu Donor Darah", result: donor.waktuDonor),
            ],
          ),
        ),
      ],
    );
  }
}

class Result extends StatelessWidget {
  const Result({Key? key, required this.title, required this.result}) : super(key: key);

  final String title, result;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title + "\n",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: result,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
