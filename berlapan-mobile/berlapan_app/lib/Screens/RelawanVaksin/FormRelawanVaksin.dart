// ignore: file_names
// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';
import 'package:berlapan_app/Screens/RelawanVaksin/models/relawanVaksin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:media_picker_builder/media_picker_builder.dart';

import 'package:intl/intl.dart';

import 'package:berlapan_app/Screens/RelawanVaksin/style.dart';
import 'detailrelawanvaksin.dart';
import 'package:xfile/xfile.dart' as xfile;
// import 'package:cross_file/src/types/interface.dart';

// import 'style.dart';

// ignore: camel_case_types
class daftarrelawanvaksin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Relawan vaksin'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormRelawanVaksin(),
          ),
        ),
      ),
    );
  }
}

// Membuat widget form
class FormRelawanVaksin extends StatefulWidget {
  @override
  FormRelawanVaksinState createState() {
    return FormRelawanVaksinState();
  }
}

// Membuat widget state form
class FormRelawanVaksinState extends State<FormRelawanVaksin> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  // VAriabel untuk menyimpan masukan gender dan peran
  late String _nama;
  late int _umur;
  late int _nomorKtp;
  late int _nomorHp;
  late String _email;
  late String _alamat;
  late String _peran = "Vaksinator";
  late String _riwayatNakes = "Ya";
  late XFile _foto;
  // Future<File>  _foto;

  bool _checkbox = false;

  var nama = TextEditingController();
  var umur = TextEditingController();
  var nomorKtp = TextEditingController();
  var nomorHp = TextEditingController();
  var email = TextEditingController();
  var alamat = TextEditingController();
  // var peran = TextEditingController();
  var riwayatNakes;
  // var foto;

  var checkbox = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 280,
        // maxWidth: 240,
        // imageQuality: 60
      );
      // print(pickedFile);
      setState(() {
        _foto = pickedFile!;
      });
    } catch (e) {
      print("Image picker error ");

      e;
    }
  }

  // Future<void> retriveLostData() async {
  //   final LostDataResponse response = await _picker.retrieveLostData();
  //   if (response.isEmpty) {
  //     return;
  //   }
  //   if (response.file != null) {
  //     setState(() {
  //       _foto = response.;
  //     });
  //   } else {
  //     print('Retrieve error ' + response.exception!.code);
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Form(
  //       key: _formKey,
  //       child: CardSettings(children: <CardSettingsSection>[
  //         CardSettingsSection(
  //           header: CardSettingsHeader(
  //             label: 'Favorite Book',
  //           ),
  //           children: <CardSettingsWidget>[
  //             CardSettingsText(
  //               label: 'Title',
  //               initialValue: "Mala",
  //               validator: (value) {
  //                 if (value == null || value.isEmpty)
  //                   return 'Title is required.';
  //               },
  //               onSaved: (value) => title = value,
  //             ),
  //             CardSettingsText(
  //               label: 'URL',
  //               initialValue: "maka",
  //               validator: (value) {
  //                 if (!value.startsWith('http:'))
  //                   return 'Must be a valid website.';
  //               },
  //               onSaved: (value) => title = value,
  //             ),
  //           ],
  //         ),
  //       ]));
  void uploadtoDjango() async {
    if (_nama != null ||
        _umur != null ||
        _peran != null ||
        riwayatNakes != null ||
        nomorHp != null ||
        _nomorKtp != null ||
        _foto != null ||
        _email != null ||
        _alamat != null) {
      final bytes = File(_foto.path).readAsBytesSync();
      String base64Image = "data:image/png;base64," + base64Encode(bytes);
      String _imageEncode = base64Image;

      print("img_pan : $base64Image");
      // String _imageEncode = base64Encode(base64Image);

      final relawanVaksin relawan = new relawanVaksin(
          nama: _nama,
          email: _email,
          alamat: _alamat,
          riwayatNakes: _riwayatNakes,
          nomorHp: _nomorHp,
          nomorKtp: _nomorKtp,
          peran: _peran,
          foto: _imageEncode,
          umur: _umur);

      final jsonRelawan = relawan.toJson();

      final jsonRelawanEncoded = jsonEncode(jsonRelawan);

      final variabel = await http.post(
          Uri.parse(
              'http://berlapan.herokuapp.com/Daftar_relawan/add_to_django/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonRelawanEncoded);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            //Menyimpan widget form field
            children: <Widget>[
              SizedBox(height: 10),
              Text(
                'Registrasi Relawan Vaksin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Nama lengkap :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: nama,
                onChanged: ((String nama) {
                  setState(() {
                    _nama = nama;
                    // print(_email);
                  });
                }),
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Masukan nama lengkap',
                  labelText: 'Nama Lengkap',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan dibutuhkan';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: email,
                onChanged: ((String email) {
                  setState(() {
                    _email = email;
                    // print(_email);
                  });
                }),
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Masukan email',
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains("@")) {
                    return 'Masukan email tidak valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                'Alamat :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: alamat,
                onChanged: ((String alamat) {
                  setState(() {
                    _alamat = alamat;
                    // print(_email);
                  });
                }),
                decoration: const InputDecoration(
                  icon: Icon(Icons.contact_mail),
                  hintText: 'Masukan Alamat Rumah Anda',
                  labelText: 'Alamat Domisili',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan dibutuhkan';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                'Umur :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: umur,
                onChanged: ((String umur) {
                  setState(() {
                    if (int.tryParse(umur) != null) {
                      _umur = int.parse(umur);
                    }
                    // print(_email);
                  });
                }),
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_history_sharp),
                  hintText: 'Masukan Usia Anda',
                  labelText: 'Usia',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Masukan umur tidak valid';
                  }
                },
              ),
              SizedBox(height: 10),
              Text(
                'Nomor Hp :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: nomorHp,
                onChanged: ((String nomorHp) {
                  setState(() {
                    if (int.tryParse(nomorHp) != null) {
                      _nomorHp = int.parse(nomorHp);
                    }
                    // print(_email);
                  });
                }),
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: 'Masukan Nomor hp',
                  labelText: 'Nomor Hp',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please enter valid phone number';
                  }
                },
              ),
              SizedBox(height: 10),
              Text(
                'Nomor Ktp :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: nomorKtp,
                onChanged: ((String nomorKtp) {
                  setState(() {
                    if (int.tryParse(nomorKtp) != null) {
                      _nomorKtp = int.parse(nomorKtp);
                    }
                    // print(_email);
                  });
                }),
                decoration: const InputDecoration(
                  icon: Icon(Icons.featured_play_list_rounded),
                  hintText: 'Masukan Nomor KTP',
                  labelText: 'Nomor KTP',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please enter valid date';
                  }
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Apakah Anda seorang nakes?',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Row(children: [
                SizedBox(
                  width: 10,
                  child: Radio(
                    value: 'Ya',
                    groupValue: _riwayatNakes,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      //value may be true or false
                      setState(() {
                        _riwayatNakes = (value != null) as String;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                Text('Ya')
              ]),
              Row(children: [
                SizedBox(
                  width: 10,
                  child: Radio(
                    value: 'Tidak',
                    groupValue: _riwayatNakes,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      //value may be true or false
                      setState(() {
                        _riwayatNakes = (value != null) as String;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                Text('Tidak')
              ]),
              SizedBox(height: 10.0),
              Text(
                'Apa peran relawan yang Anda Inginkan ?',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(3.0)),
                child: DropdownButton<String>(
                  value: _peran,
                  isExpanded: true,
                  icon: Icon(Icons.keyboard_arrow_down, size: 22),
                  underline: SizedBox(),
                  onChanged: (value) {
                    //Do something with this value
                    setState(() {
                      _peran = value!;
                    });
                  },
                  items: <String>[
                    "Vaksinator",
                    "Registrasi",
                    "Pelaporan",
                    "Screening"
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text(
                  'Saya setuju dengan semua persyaratan yang diatur dan ditetapkan oleh Berlapan.com',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                value: _checkbox,
                activeColor: Colors.deepPurpleAccent,
                onChanged: (value) {
                  setState(() {
                    _checkbox = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              Divider(
                thickness: 0.3,
              ),
              SizedBox(height: 10),
              Text('Masukan foto Anda ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              FloatingActionButton(
                onPressed: _pickImage,
                tooltip: 'Pick Image from gallery',
                child: Icon(Icons.photo_library),
              ),
              // SizedBox(height: 20),
              // Center(
              //     child: FutureBuilder<void>(
              //   future: retriveLostData(),
              //   builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              //     switch (snapshot.connectionState) {
              //       case ConnectionState.none:
              //       case ConnectionState.waiting:
              //         return const Text('Picked an image');
              //       case ConnectionState.done:
              //         if (_foto != null) {
              //           return _previewImage();
              //         }

              //         return const Text('Picked an image');
              //       default:
              //         return const Text('Picked an image');
              //     }
              //   },
              // )),
              SizedBox(height: 20),
              OutlinedButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    uploadtoDjango();
                    Navigator.pushNamed(context, '/');
                  }
                },
                child: const Text('Submit'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green,
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _previewImage() {
    if (_foto != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(File(_foto.path)),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }
}
