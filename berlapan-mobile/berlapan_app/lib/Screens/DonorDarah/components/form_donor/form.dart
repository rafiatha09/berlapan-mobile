import 'package:berlapan_app/Screens/DonorDarah/api/api.dart';
import 'package:berlapan_app/Screens/DonorDarah/models/donor_data.dart';
import 'package:berlapan_app/Screens/DonorDarah/output_form_donor_screen.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:provider/provider.dart';
import 'package:berlapan_app/constants/constants.dart';
import 'button.dart';

class FormDonor extends StatefulWidget {
  const FormDonor({
    Key? key,
  }) : super(key: key);

  @override
  _FormDonorState createState() => _FormDonorState();
}

class _FormDonorState extends State<FormDonor> {

  final formKey = GlobalKey<FormState>();

  final namaControl = TextEditingController();
  String tglLahirControl = '';
  final nikControl = TextEditingController();
  final sentraControl = TextEditingController();
  String goldarControl = 'Pilih';
  String waktuControl = '';
  bool cekSadarControl = false;
  bool cekSyaratControl = false;

  bool onAdd() {
    final String nama = namaControl.text;
    final String tglLahir = tglLahirControl;
    final String nik = nikControl.text;
    final String sentra = sentraControl.text;
    final String goldar = goldarControl;
    final String waktuDonor = waktuControl;
    final bool cekSadar = cekSadarControl;
    final bool cekSyarat = cekSyaratControl;

    if (nama.isNotEmpty &&
        tglLahir.isNotEmpty &&
        nik.isNotEmpty &&
        sentra.isNotEmpty &&
        waktuDonor.isNotEmpty &&
        (goldar != 'Pilih') &&
        cekSadar &&
        cekSyarat) {
      final DonorData newData = DonorData(
        id: '1',
        nama: nama,
        nik: nik,
        tglLahir: tglLahir,
        goldar: goldar,
        sentra: sentra,
        waktuDonor: waktuDonor,
      );

      Provider.of<DonorDataProvider>(context, listen: false).addData(newData);
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 32),
              Text(
                "Data Diri",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              buildName(),
              const SizedBox(height: 20),
              buildTanggalLahir(),
              const SizedBox(height: 32),
              buildNIK(),
              const SizedBox(height: 32),
              Text(
                "Data Relawan Donor Darah",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              buildSentra(),
              const SizedBox(height: 20),
              buildGoldar(),
              const SizedBox(height: 32),
              buildWaktuDonor(),
              const SizedBox(height: 32),
              buildCekSadar(),
              const SizedBox(height: 32),
              buildCekSyarat(),
              const SizedBox(height: 32),
              buildSubmit(),
            ],
          ),
        ),
      );

  Widget buildName() => TextFormField(
        decoration: const InputDecoration(
          hintText: 'Masukkan nama lengkap',
          labelText: 'Nama Lengkap',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value != null && value.length < 4) {
            return 'Masukkan nama yang valid';
          } else {
            return null;
          }
        },
        maxLength: 50,
        controller: namaControl,
      );

  Widget buildNIK() => TextFormField(
        decoration: const InputDecoration(
          hintText: 'Masukkan NIK',
          labelText: 'Nomor Induk Kependudukan (NIK)',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value != null && value.length < 16) {
            return 'Masukkan NIK yang valid';
          } else {
            return null;
          }
        },
        maxLength: 16,
        controller: nikControl,
      );

  Widget buildSentra() => TextFormField(
        decoration: const InputDecoration(
          hintText: 'Masukkan Sentra Layanan Donor Darah',
          labelText: 'Sentra Layanan Donor Darah',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan Sentra Layanan yang valid';
          } else {
            return null;
          }
        },
        maxLength: 50,
        controller: sentraControl,
      );

  Widget buildWaktuDonor() => DateTimeFormField(
        decoration: const InputDecoration(
          hintStyle: TextStyle(color: Colors.black45),
          errorStyle: TextStyle(color: Colors.redAccent),
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.event_note),
          labelText: 'Waktu Donor Darah',
        ),
        firstDate: DateTime.now().add(const Duration(days: 1)),
        initialDate: DateTime.now().add(const Duration(days: 1)),
        validator: (DateTime? e) {
          if (e == null) {
            return 'Masukkan waktu donor yang valid';
          } else {
            return null;
          }
        },
        onDateSelected: (DateTime value) {
          waktuControl = value.toString();
          print(value);
        },
      );

  Widget buildTanggalLahir() => DateTimeFormField(
        decoration: const InputDecoration(
          hintStyle: TextStyle(color: Colors.black45),
          errorStyle: TextStyle(color: Colors.redAccent),
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.event_note),
          labelText: 'Tanggal Lahir',
        ),
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        validator: (DateTime? e) {
          if (e == null) {
            return 'Masukkan tanggal lahir yang valid';
          } else {
            return null;
          }
        },
        onDateSelected: (DateTime value) {
          tglLahirControl = value.toString();
          print(value);
        },
      );

  Widget buildGoldar() => DropdownButtonFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Golongan Darah',
            hintText: 'Pilih Golongan Darah'),
        value: goldarControl,
        validator: (value) {
          if (value == 'Pilih') {
            return 'Pilih Golongan Darah';
          } else {
            return null;
          }
        },
        onChanged: (String? newValue) {
          setState(() {
            goldarControl = newValue!;
          });
        },
        items: <String>['Pilih', 'A', 'B', 'O', 'AB']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );

  Widget buildCekSadar() => CheckboxListTile(
        title: const Text(
            "Saya mengisi data dengan sesungguhnya dan dalam keadaan sadar."),
        activeColor: kPrimaryColor,
        value: cekSadarControl,
        onChanged: (value) {
          setState(() {
            cekSadarControl = !cekSadarControl;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      );

  Widget buildCekSyarat() => CheckboxListTile(
        title: const Text("Saya telah memenuhi persyaratan pendonor darah."),
        activeColor: kPrimaryColor,
        value: cekSyaratControl,
        onChanged: (value) {
          setState(() {
            cekSyaratControl = !cekSyaratControl;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Daftar',
          onClicked: () async {
            final isValid = formKey.currentState?.validate();

            if (isValid != null && isValid && onAdd()) {
              formKey.currentState?.save();
              const message = 'Pendaftaran berhasil!';
              const snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: kPrimaryColor,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => OutputFormDonorPage()));
            }
          },
        ),
      );
}
