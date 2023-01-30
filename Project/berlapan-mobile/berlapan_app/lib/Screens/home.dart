import 'dart:ui';
import 'package:berlapan_app/screens/daftar_vaksinasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:berlapan_app/constants/style_cons.dart';
import 'package:berlapan_app/models/statis_model.dart';
import 'package:berlapan_app/models/news_model.dart';
import 'package:berlapan_app/Screens/donor.dart';
import 'package:berlapan_app/Screens/RelawanVaksin/mainRelawanVaksin.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Blog> listBlog = [];
  String fix = "loading...";

  Repo repo = Repo(); // ngambil kumpulan datanya

  getData() async {
    listBlog = await repo.getData();

    for (var i = 0; i < listBlog.length; i++) {
      if ("rafiatha" == listBlog[i].username) {
        // tergantung usernya aja
        fix = listBlog[i].username + "!";
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 24),
            child: Text("Hallo bro, " + fix, style: mTitleStyle),
          ),
          // discound
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16, right: 16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount:
                          carousels.length, // ngambil dari carousel_model.dart
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(
                                    carousels[index].image,
                                  ),
                                  fit: BoxFit.cover)),
                        );
                      }),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: map<Widget>(carousels, (index, image) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 6,
                          width: 6,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index ? mPrimary : mGreyColor),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text("Yuk booking!", style: mTitleStyle),
          ),
          Container(
            height: 144,
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // BUAT GREG
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DaftarVaksinasi()),
                            );
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/daftar_vaksin.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Daftar Vaksin",
                                        style: mServiceTitleStyle),
                                    Text(
                                      "Si Panjang Umur",
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // SALSA
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DonorDarah()),
                            );
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/donor_darah.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Donor Darah",
                                        style: mServiceTitleStyle),
                                    Text(
                                      "Si Baik",
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // GILANG
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mainRelawanVaksin()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/relawan_vaksin.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Relawan Vaksin",
                                        style: mServiceTitleStyle),
                                    Text(
                                      "Si Penyelamat",
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // skip
                          }); // pake pop ya
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/saling_bantu.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Saling Bantu",
                                        style: mServiceTitleStyle),
                                    Text(
                                      "Si Curcol",
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text("Kata Orang-Orang Kuat", style: mTitleStyle),
          ),
          Container(
            height: 240,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16, right: 16),
              scrollDirection: Axis.horizontal,
              itemCount: Data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    height: 180,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: mBorderColor, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            Data[index].image,
                            height: 74,
                          ),
                          Text(
                            Data[index].name,
                            style: mTitleStyle,
                          ),
                          Text(
                            Data[index].country,
                            style: mPopularSubtitleStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              Data[index].thoughts,
                              style: mContentStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text("Berita COVID-19 Terkini", style: mTitleStyle),
          ),
          Container(
            height: 181,
            child: ListView.builder(
              itemCount: travelData.length,
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PopUp(
                                        title: travel[index].judul,
                                        content: travel[index].content_full,
                                      )),
                            );
                          });
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 104,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(travel[index].image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              child: Text(
                                "Berlapan",
                                style: mTitle,
                              ),
                              right: 8,
                              top: 8,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        travel[index].content,
                        maxLines: 3,
                        style: mContentStyle,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        travel[index].pubDate,
                        maxLines: 3,
                        style: mPlaceStyle,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PopUp extends StatelessWidget {
  const PopUp({Key? key, required this.title, required this.content})
      : super(key: key);

  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          backgroundColor: mBackgroundColor,
          body: Stack(
            children: [
              Center(
                child: Card(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          title,
                          style: mTitleStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                          width: 10,
                        ),
                        Text(
                          content,
                          style: mContentStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 8)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
