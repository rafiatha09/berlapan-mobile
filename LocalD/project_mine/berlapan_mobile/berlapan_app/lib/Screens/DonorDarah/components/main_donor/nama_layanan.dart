import 'package:flutter/material.dart';

import 'package:berlapan_app/constants/constants.dart';

class NamaLayanan extends StatelessWidget {
  const NamaLayanan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          NamaLayananCard(
            image: "assets/images/image_1.png",
            title: "Rumah Sakit Metro",
            country: "Jakarta Pusat",
            press: (){},
          ),
          NamaLayananCard(
            image: "assets/images/image_2.png",
            title: "Rumah Sakit Mitra",
            country: "Bekasi",
            press: (){},
          ),
          NamaLayananCard(
            image: "assets/images/image_3.png",
            title: "Rumah Sakit Donor",
            country: "Depok",
            press: (){},
          ),
        ],
      ),
    );
  }
}

class NamaLayananCard extends StatelessWidget {
  const NamaLayananCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.press,
  }) : super(key: key);

  final String image, title, country;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: country.toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
