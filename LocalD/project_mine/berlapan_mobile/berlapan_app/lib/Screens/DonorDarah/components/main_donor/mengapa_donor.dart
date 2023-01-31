import 'package:flutter/material.dart';

import 'package:berlapan_app/constants/constants.dart';

class MengapaDonorDarah extends StatelessWidget {
  const MengapaDonorDarah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          MengapaDonorDarahCard(
            image: "assets/images/bottom_img_1.png",
            press: () {},
          ),
          MengapaDonorDarahCard(
            image: "assets/images/bottom_img_2.png",
            press: () {},
          ),
          MengapaDonorDarahCard(
            image: "assets/images/bottom_img_3.png",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class MengapaDonorDarahCard extends StatelessWidget {
  const MengapaDonorDarahCard({
    Key? key,
    required this.image,
    required this.press,
  }) : super(key: key);
  final String image;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
