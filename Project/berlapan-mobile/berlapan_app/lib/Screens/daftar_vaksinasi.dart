import 'dart:convert';
import 'package:berlapan_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DaftarVaksinasi extends StatelessWidget {
  const DaftarVaksinasi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berlapan - Daftar Vaksinasi',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Berlapan - Daftar Vaksinasi'),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Ayo Vaksinasi',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Mengapa sih saya harus divaksinasi?',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.0),
                Syarat('1. Mencegah risiko tertular COVID-19',
                    'Vaksinasi membuat seseorang tidak mudah tertular COVID-19. Akan tetapi, protokol kesehatannya tetap dijaga ya!'),
                SizedBox(height: 10.0),
                Syarat(
                    '2. Mengurangi risiko gejala berat jika terkena COVID-19',
                    'Vaksinasi membuat sistem imun tubuh kita lebih kuat melawan virus Corona. Walaupun sampai tertular, gejala yang ditimbulkan dari infeksi COVID-19 pada orang yang telah divaksinasi biasanya ringan.'),
                SizedBox(height: 10.0),
                Syarat('3. Mendorong terbentuknya Herd Immunity',
                    'Bila diberikan secara massal, vaksin COVID-19 juga mampu mendorong terbentuknya kekebalan kelompok (herd immunity) dalam masyarakat. Artinya, orang yang tidak bisa mendapatkan vaksin, misalnya bayi baru lahir, lansia, atau penderita kelainan sistem imun tertentu, bisa mendapatkan perlindungan dari orang-orang di sekitarnya.'),
                SizedBox(height: 10.0),
                Syarat('4. Meminimalisasi dampak ekonomi dan sosial',
                    'Jika sebagian besar masyarakat sudah memiliki sistem kekebalan tubuh yang baik untuk melawan penyakit COVID-19, kegiatan sosial dan ekonomi masyarakat bisa kembali seperti sediakala.'),
                SizedBox(height: 15.0),
                ElevatedButton(
                  child: Text('Ayo Daftar Vaksinasi Sekarang!'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DaftarVaksinasiForm()));
                  },
                ),
                SizedBox(height: 15.0),
                ElevatedButton(
                  child: Text('Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]),
        ),
      ),
    );
  }
}

class Syarat extends StatelessWidget {
  final String judul;
  final String isi;

  const Syarat(this.judul, this.isi);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.yellow),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(this.judul + "\n" + this.isi),
      ),
    );
  }
}

class DaftarVaksinasiForm extends StatelessWidget {
  const DaftarVaksinasiForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Daftar Vaksinasi',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Pendaftaran Vaksinasi'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.green),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Form Pendaftaran Vaksinasi',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              SizedBox(height: 15.00),
              const FormDaftar(),
              SizedBox(height: 10.00),
              ElevatedButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormDaftar extends StatefulWidget {
  const FormDaftar({Key? key}) : super(key: key);

  @override
  FormDaftarState createState() {
    return FormDaftarState();
  }
}

class FormDaftarState extends State<FormDaftar> {
  final _formKey = GlobalKey<FormState>();
  late Summary summary;

  //Variable yang menampung Nama, NIK, Tanggal Lahir
  String _valNama = '';
  String _valNIK = '';
  String _valLahir = '';

  //Untuk dropdown alamat sentra vaksinasi
  String _sentraUrl =
      'http://berlapan.herokuapp.com/daftar-vaksinasi/alamat_json';
  String _valSentraVaksinasi = 'Somewhere in Kota Serang';
  List<dynamic> _dataSentraVaksinasi = <dynamic>[];

  getSentraVaksinasi() async {
    final response = await http.get(Uri.parse(_sentraUrl));
    var listData = jsonDecode(response.body);
    setState(() {
      _dataSentraVaksinasi = listData;
    });
    print("data : $listData");
  }

  @override
  void initState() {
    super.initState();
    getSentraVaksinasi();
    getTanggalTersedia();
    getJam();
  }

  //Untuk dropdown tanggal Vaksinasi
  String _tanggalUrl =
      'http://berlapan.herokuapp.com/daftar-vaksinasi/tanggal_json';
  String _valTanggalTersedia = "2021-11-04";
  List<dynamic> _dataTanggalTersedia = <dynamic>[];

  getTanggalTersedia() async {
    final response = await http.get(Uri.parse(_tanggalUrl));
    var listData = jsonDecode(response.body);
    setState(() {
      _dataTanggalTersedia = listData;
    });
    print("data : $listData");
  }

  //Untuk dropdown jam vaksinasi
  String _jamUrl = 'http://berlapan.herokuapp.com/daftar-vaksinasi/jam_json';
  String _valJam = "08.00 - 09.00";
  List<dynamic> _dataJam = <dynamic>[];

  getJam() async {
    final response = await http.get(Uri.parse(_jamUrl));
    var listData = jsonDecode(response.body);
    setState(() {
      _dataJam = listData;
    });
    print("data : $listData");
  }

  //Untuk dropdown Vaksinasi ke-
  final pilihanVaksinasiKe = ["1", "2"];
  String vaksinasiKeTerpilih = "1";

  //Membuat method buildMenuItem
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ),
      );

  //Method isNumeric
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  String selectedTanggalVaksinasi = "";
  Widget build(BuildContext context) {
    String tanggalLahir = "";
    DateTime tanggalLahirPilihan;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Nama:",
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mohon isi field ini.';
              }
              return null;
            },
            onChanged: (value) => setState(() {
              _valNama = value;
            }),
            decoration: InputDecoration(
              labelText: 'Masukkan nama Anda',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "Tanggal Lahir:",
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mohon isi field ini.';
              }
              return null;
            },
            onChanged: (value) => setState(() {
              _valLahir = value;
            }),
            decoration: InputDecoration(
              labelText: 'Format : yyyy-mm-dd',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "NIK:",
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mohon isi field ini.';
              } else if (!(isNumeric(value))) {
                return 'Mohon isi field ini dengan numerik';
              }
              return null;
            },
            onChanged: (value) => setState(() {
              _valNIK = value;
            }),
            decoration: InputDecoration(
              labelText: 'Masukkan NIK Anda (Harus numerik)',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "Alamat Sentra Vaksinasi:",
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButton(
                hint: Text('Silakan Pilih Sentra Vaksinasi'),
                isExpanded: true,
                items: _dataSentraVaksinasi.map((item) {
                  return DropdownMenuItem(
                    child: Text(item['fields']['alamat_sentra_vaksinasi']),
                    value: item['fields']['alamat_sentra_vaksinasi'],
                  );
                }).toList(),
                value: _valSentraVaksinasi,
                onChanged: (val) {
                  setState(() {
                    this._valSentraVaksinasi = val as String;
                  });
                }),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "Tanggal Vaksinasi: ",
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButton(
                hint: Text('Silakan pilih Jam Vaksinasi'),
                isExpanded: true,
                items: _dataTanggalTersedia.map((item) {
                  return DropdownMenuItem(
                    child: Text(item['fields']['tanggal']),
                    value: item['fields']['tanggal'],
                  );
                }).toList(),
                value: _valTanggalTersedia,
                onChanged: (val) {
                  setState(() {
                    this._valTanggalTersedia = val as String;
                  });
                }),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "Jam Vaksinasi: ",
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButton(
                hint: Text('Silakan pilih Jam Vaksinasi'),
                isExpanded: true,
                items: _dataJam.map((item) {
                  return DropdownMenuItem(
                    child: Text(item['fields']['jam']),
                    value: item['fields']['jam'],
                  );
                }).toList(),
                value: _valJam,
                onChanged: (val) {
                  setState(() {
                    this._valJam = val as String;
                  });
                }),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "Vaksinasi Ke- :",
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButton<String>(
                isExpanded: true,
                items: pilihanVaksinasiKe.map(buildMenuItem).toList(),
                value: vaksinasiKeTerpilih,
                onChanged: (value) {
                  setState(() {
                    this.vaksinasiKeTerpilih = value as String;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pendaftaran Berhasil')),
                  );
                  print('Nama          : ' + _valNama);
                  print('NIK           : ' + _valNIK);
                  print('Tanggal Lahir : ' + _valLahir);
                  print('Sentra        : ' + _valSentraVaksinasi);
                  print('Tanggal Vaksin: ' + _valTanggalTersedia);
                  print('Jam           : ' + _valJam);
                  print('Vaksinasi Ke- : ' + vaksinasiKeTerpilih);
                }
                final variabel = await http.post(
                    Uri.parse(
                        'http://berlapan.herokuapp.com/daftar-vaksinasi/add_to_django'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      'nama': _valNama,
                      'nik': _valNIK,
                      'tanggal_lahir': _valLahir,
                      'sentra': _valSentraVaksinasi,
                      'tanggal_vaksinasi': _valTanggalTersedia,
                      'jam': _valJam,
                      'vaksinasi_ke': vaksinasiKeTerpilih,
                    }));
                Summary summary = Summary(
                    _valNama,
                    _valNIK,
                    _valLahir,
                    _valSentraVaksinasi,
                    _valTanggalTersedia,
                    _valJam,
                    vaksinasiKeTerpilih);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowSummary(
                              summary: summary,
                            )));
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class Summary {
  final String nama;
  final String nik;
  final String tanggalLahir;
  final String sentra;
  final String tanggalVaksinasi;
  final String jam;
  final String vaksinasiKe;

  const Summary(this.nama, this.nik, this.tanggalLahir, this.sentra,
      this.tanggalVaksinasi, this.jam, this.vaksinasiKe);
}

class ShowSummary extends StatelessWidget {
  const ShowSummary({Key? key, required this.summary}) : super(key: key);

  final Summary summary;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiket Vaksinasi',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tiket Vaksinasi'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.green),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Tiket Vaksinasi',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.yellow),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Nama               : ' + summary.nama,
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        'Tanggal Lahir      : ' + summary.tanggalLahir,
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        'NIK                : ' + summary.nik,
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sentra Vaksinasi     : ' + summary.sentra,
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        'Tanggal Vaksinasi    : ' + summary.tanggalVaksinasi,
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        'Sesi                 : ' + summary.jam,
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        'Vaksinasi Ke-        : ' + summary.vaksinasiKe,
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Persyaratan Vaksinasi',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        '-Peserta harus menunjukkan tiket vaksinasi saat hari-H',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        '-Peserta harus menunjukkan KTP asli saat hari-H',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        '-Peserta diwajibkan memakai masker saat berada di sentra vaksinasi',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        'Peserta mengikuti arahan petugas di sentra vaksinasi',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.00),
              ElevatedButton(
                child: Text('Kembali Ke Home'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
