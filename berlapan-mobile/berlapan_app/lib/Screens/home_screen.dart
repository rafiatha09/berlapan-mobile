import 'package:flutter/material.dart';
import 'package:berlapan_app/constants/style_cons.dart';
import 'package:berlapan_app/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:berlapan_app/screens/search.dart';
// sorce: https://www.youtube.com/watch?v=WUUmD8s-5wY

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int _selected_index = 0;

  var bottomTextStyle = GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500);

  void _onItemTapped(int index){
    setState(() {
      _selected_index = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Search(),
    Text('Index 2: Account',), // BUAT PROFILE ACCOUNT
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        toolbarHeight: 85,
        backgroundColor: mBackgroundColor,
        title: Image.asset('assets/images/Berlapan_logo.png'),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,

      // bottom navbar
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
            color: mFillColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(0,5)
              )
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            )
        ),

        child: BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: _selected_index == 0 ?
            SvgPicture.asset(
              'assets/icons/home_colored.svg',
              height: 16,
              width: 16,
            ):
            SvgPicture.asset(
                'assets/icons/home.svg',
              height: 16,
              width: 16,
            ),
                title: Text(
                  'Home',
                  style: bottomTextStyle, // pake label bisa tapi ga ada stlyenya nanti
                )),
          BottomNavigationBarItem(icon: _selected_index == 1 ?
            SvgPicture.asset(
                'assets/icons/search_colored.svg',
              height: 16,
              width: 16,
            ):
            SvgPicture.asset(
              'assets/icons/search.svg',
              height: 16,
              width: 16,
            ),
                title: Text(
                  'Search',
                  style: bottomTextStyle,
                )),
          BottomNavigationBarItem(icon: _selected_index == 2 ?
            SvgPicture.asset(
              'assets/icons/account_colored.svg',
              height: 16,
              width: 16,
            ):
            SvgPicture.asset(
              'assets/icons/account.svg',
              height: 16,
              width: 16,
            ),
                title: Text(
                  'Account',
                  style: bottomTextStyle,
                )),
        ],
          currentIndex: _selected_index,
          unselectedItemColor: mSubtitleColor,
          selectedItemColor: mPrimary,
          onTap: _onItemTapped,
          selectedFontSize: 12,
          showUnselectedLabels: true,
          elevation: 0,
        ),
      ),
      body: _widgetOptions.elementAt(_selected_index), // bodynya
    );
  }
}
