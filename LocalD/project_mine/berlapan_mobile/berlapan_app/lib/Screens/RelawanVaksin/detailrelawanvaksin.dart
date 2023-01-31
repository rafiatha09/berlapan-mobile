import 'package:berlapan_app/Screens/RelawanVaksin/models/relawanVaksin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Future<List<relawanVaksin>> dataRelawanVaksin;
  final dataRelawanVaksinKey = GlobalKey<HomeState>();

  @override
  void initState() {
    super.initState();
    dataRelawanVaksin = getDataRelawanVaksinList();
  }

  Future<List<relawanVaksin>> getDataRelawanVaksinList() async {
    final response = await http.get(Uri.parse(
        "http://berlapan.herokuapp.com/Daftar_relawan/dataRelawanVaksinJson"));

    // final response = await http.get("${Env.URL_PREFIX}/Daftar_relawan/dataRelawanVaksinJson");

    // if (response.statusCode == 200) {
    //    return relawanVaksin.fromJson(json)jsonDecode(response.body)
    // } else {
    //   throw Exception('Unable to fetch products from the REST API');
    // }

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<relawanVaksin> dataRelawanVaksin = items.map<relawanVaksin>((json) {
      return relawanVaksin.fromJson(json);
    }).toList();

    return dataRelawanVaksin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: dataRelawanVaksinKey,
      appBar: AppBar(
        title: Text('Detail Relawan Vaksin'),
      ),
      body: Center(
        child: FutureBuilder<List<relawanVaksin>>(
          future: dataRelawanVaksin,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            // Render employee lists
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                if (snapshot.hasData) {
                  var data = snapshot.data[index];
                  return Card(
                    //shape: ShapeBorder().,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data.foto),
                      ),
                      title: Text(
                        data.nama,
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text("Peran : " +
                          data.peran +
                          "\n" +
                          "Usia : " +
                          data.umur.toString()),
                      trailing: Wrap(
                        children: <Widget>[
                          Icon(IconData(0xe792,
                              fontFamily: 'MaterialIcons',
                              matchTextDirection: true)),
                          // Icon(Icons.message), // icon-2
                        ],
                      ),
                      // isThreeLine: true,

                      onTap: () => {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    DetailRelawanVaksin(data)))
                      },
                    ),
                  );
                } else {
                  return Text('${snapshot.error}');
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class DetailRelawanVaksin extends StatelessWidget {
  final relawanVaksin relawanvaksin;

  // final double coverHeight = 280;
  // final double profileHeight = 144;

  DetailRelawanVaksin(this.relawanvaksin);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Profile Relawan Vaksin")),
      body: ListView(
          clipBehavior: Clip.none,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  buildProfileImage(),
                  const SizedBox(
                    height: 10,
                  ),
                  buildContent(),
                ],
              ),
            ),
          ]),
    );
    // throw UnimplementedError();
  }

  // Widget buildCoverImage() => Container(
  //     color: Colors.green[200],
  //     child: Image(
  //       image: new AssetImage('images/pameran-otomotif.jpg'),
  //       width: double.infinity,
  //       height: coverHeight,
  //       fit: BoxFit.cover,
  //     ));

  Widget buildProfileImage() => CircleAvatar(
        radius: 90,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(relawanvaksin.foto),
      );

  Widget buildContent() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            relawanvaksin.nama,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            relawanvaksin.peran,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
          ),
          Divider(thickness: 1.0),
          Text("Umur : " + relawanvaksin.umur.toString()),
          SizedBox(height: 16),
          Text("Nomor Hp : " + relawanvaksin.nomorHp.toString()),
          SizedBox(height: 16),
          Text("Nomor Ktp : " + relawanvaksin.nomorKtp.toString()),
          SizedBox(height: 16),
          Text("Pekerja nakes : " + relawanvaksin.riwayatNakes),
          SizedBox(height: 16),
          Text("Alamat : " + relawanvaksin.alamat),
          SizedBox(height: 16),
        ]),
      );
}
