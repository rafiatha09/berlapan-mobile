// import 'package:card_settings/card_settings.dart';
import 'dart:ui';
import 'package:berlapan_app/Screens/RelawanVaksin/FormRelawanVaksin.dart';
import 'package:flutter/material.dart';

import 'package:berlapan_app/Screens/RelawanVaksin/detailrelawanvaksin.dart';

import 'style.dart';

// void main() => runApp(App());

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter + Django',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => Home(),
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';


class mainRelawanVaksin extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<mainRelawanVaksin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berlapan.com',
      //Menyimpan settingan design aplikasi
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.indigo,
        canvasColor: Colors.white,
        fontFamily: 'Rubik',

        // textTheme: TextTheme(title: AppBarTextStyle)

        // textTheme:
        // textTheme: ThemeData.light().textTheme.copyWith(
        //     bodyText1: TextStyle(
        //       color: Color.fromRGBO(20, 51, 51, 1),
        //     ),
        //     bodyText2: TextStyle(
        //       color: Color.fromRGBO(20, 51, 51, 1),
        //     ),
        //     headline6: TextStyle(
        //       fontSize: 20,
        //       fontFamily: 'RobotoCondensed',
        //       // fontWeight: FontWeight,
        //     )),
      ),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.

      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/daftarrelawanvaksin': (context) => daftarrelawanvaksin(),
        // '/datarelawanvaksinsingkat': (context) => detailrelawanvaksin(),

        '/datarelawanvaksindetail': (context) => Home(),
      },
    );
  }
}

// Widget halaman utama
class FirstScreen extends StatelessWidget {
  double blurImage = 0;
  double blurBox = 0.8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/images/relawanvaksin.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.black.withOpacity(0.4),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Data Relawan Vaksin',
                        style: AppBarTextStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                          ' Untuk membantu pemerataan vaksin di Indonesia, Berlapan.com menginisiasi gerakan vaksinasi gratis untuk masyarakat di sekitar. Untuk merealisasikan gerakan ini, Kami mengajak Kalian untuk secara sukarela mendaftar jadi relawan vaksin. Kami sangat membutuhkan relawan-relawan vaksin yang untuk memenuhi peran menjadi vaksinator, screening, pelaporan, dan Registerasi. silahkan mendaftar menjadi relawan vaksin di Berlapan.com dengan menekan button di bawah ini. ',
                          style: Body1TextStyle,
                          textAlign: TextAlign.justify),
                      SizedBox(height: 10),
                      ElevatedButton(
                        // Within the `FirstScreen` widget
                        onPressed: () {
                          // Navigate to the second screen using a named route.
                          Navigator.pushNamed(context, '/daftarrelawanvaksin');
                        },
                        child: const Text('Registrasi Relawan Vaksin'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        // Within the `FirstScreen` widget
                        onPressed: () {
                          // Navigate to the second screen using a named route.
                          Navigator.pushNamed(
                              context, '/datarelawanvaksindetail');
                        },
                        child: const Text('Detail Relawan Vaksin'),
                      ),

                      // buildImageOverlay(),
                      const SizedBox(height: 32),
                      //   Slider(
                      //   value: blurBox,
                      //   max: 0.8,
                      //   onChanged: (value) => setState(() => blurBox = value),
                      // ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// @override
// Widget build(BuildContext context) {
//   // ignore: dead_code
//   return Scaffold(
//     resizeToAvoidBottomInset: false, // set it to false
//     appBar: AppBar(
//       title: const Text('Berlapan.com'),
//     ),
//     body: ListView(
//       physics: BouncingScrollPhysics(),
//       padding: EdgeInsets.all(16),
//       children: [
//         buildBlurredImage(),
// Column(
//   mainAxisAlignment: MainAxisAlignment.start,
//   crossAxisAlignment: CrossAxisAlignment.stretch,
//   children: [
//     SizedBox(height: 10),
//     Text(
//       'Data Relawan Vaksin',
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     ),
//     SizedBox(height: 10),
//     Text(
//         ' Untuk membantu pemerataan vaksin di Indonesia, Berlapan.com menginisiasi gerakan vaksinasi gratis untuk masyarakat di sekitar. Untuk merealisasikan gerakan ini, Kami mengajak Kalian untuk secara sukarela mendaftar jadi relawan vaksin. Kami sangat membutuhkan relawan-relawan vaksin yang untuk memenuhi peran menjadi vaksinator, screening, pelaporan, dan Registerasi. silahkan mendaftar menjadi relawan vaksin di Berlapan.com dengan menekan button di bawah ini. ',
//         style: Body1TextStyle,
//         textAlign: TextAlign.justify),
//     SizedBox(height: 10),
//     ElevatedButton(
//       // Within the `FirstScreen` widget
//       onPressed: () {
//         // Navigate to the second screen using a named route.
//         Navigator.pushNamed(context, '/daftarrelawanvaksin');
//       },
//       child: const Text('Registrasi Relawan Vaksin'),
//     ),
//     SizedBox(height: 10),
//     ElevatedButton(
//       // Within the `FirstScreen` widget
//       onPressed: () {
//         // Navigate to the second screen using a named route.
//         Navigator.pushNamed(context, '/datarelawanvaksindetail');
//       },
//       child: const Text('Detail Relawan Vaksin'),
//     ),

//     buildImageOverlay(),
//     const SizedBox(height: 32),
//     //   Slider(
//     //   value: blurBox,
//     //   max: 0.8,
//     //   onChanged: (value) => setState(() => blurBox = value),
//     // ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

//   Widget buildBlurredImage() => ClipRRect(
//         borderRadius: BorderRadius.circular(24),
//         child: Stack(
//           children: [
//             Image.network(
//               'https://images.unsplash.com/photo-1606569371439-56b1e393a06b?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=2134&q=80',
//               fit: BoxFit.cover,
//             ),
//             Positioned.fill(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(
//                   sigmaX: blurImage,
//                   sigmaY: blurImage,
//                 ),
//                 child: Container(color: Colors.black.withOpacity(0.2)),
//               ),
//             ),
//           ],
//         ),
//       );

//   Widget buildImageOverlay() => ClipRRect(
//         borderRadius: BorderRadius.circular(24),
//         child: Stack(
//           children: [
//             Image.network(
//               'https://images.unsplash.com/photo-1606569371439-56b1e393a06b?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=2134&q=80',
//               fit: BoxFit.cover,
//             ),
//             Positioned(
//               top: 32,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: buildBlur(
//                   borderRadius: BorderRadius.circular(2),
//                   child: Container(
//                     padding: EdgeInsets.all(24),
//                     color: Colors.white.withOpacity(0),
//                     child: Text(
//                       'Daftar Relawan Vaksin',
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green[400],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );

//   Widget buildBlur({
//     @required Widget child,
//     BorderRadius borderRadius,
//     double sigmaX = 10,
//     double sigmaY = 10,
//   }) =>
//       ClipRRect(
//         borderRadius: borderRadius ?? BorderRadius.zero,
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
//           child: child,
//         ),
//       );
// }

// Widget untuk menyajikan widget data  pendaftar relawan vaksin
// class detailrelawanvaksin extends StatefulWidget {
//   @override
//   detailrelawanvaksinstate createState() => detailrelawanvaksinstate();
// }

// class detailrelawanvaksinstate extends State<detailrelawanvaksin> {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail Relawan Vaksin'),
//       ),
//       body: Center(
//         child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ListView(children: <Widget>[
//               Center(
//                   child: Text(
//                 'Data Relawan Vaksin',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               )),
//               DataTable(
//                 columns: [
//                   DataColumn(
//                       label: Text('Peran',
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.bold))),
//                   DataColumn(
//                       label: Text('Nama',
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.bold))),
//                   DataColumn(
//                       label: Text('Tanggal Lahir',
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.bold))),
//                 ],
//                 rows: [
//                   DataRow(cells: [
//                     DataCell(Text('Vaksinator')),
//                     DataCell(Text('Stephen')),
//                     DataCell(Text('18 Agustus 1965')),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(Text('Screening')),
//                     DataCell(Text('John')),
//                     DataCell(Text('18 Agustus 1965')),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(Text('Registrasi')),
//                     DataCell(Text('Harry')),
//                     DataCell(Text('18 Agustus 1965')),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(Text('Administrasi')),
//                     DataCell(Text('Peter')),
//                     DataCell(Text('18 Agustus 1965')),
//                   ]),
//                 ],
//               ),
//             ])),
//       ),
//     );
//   }
// }
