import 'package:berlapan_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          
          Container(
              padding: const EdgeInsets.only(
              top: kDefaultPadding,
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Yuk, Donor Darah!',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.asset("assets/images/logo.png")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
