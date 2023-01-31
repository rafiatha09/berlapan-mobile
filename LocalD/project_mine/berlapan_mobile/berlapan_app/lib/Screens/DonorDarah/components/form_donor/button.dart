import 'package:berlapan_app/constants/constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: onClicked,
    child: Text(
      text,
      style: TextStyle(fontSize: 18),
    ),
    style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        minimumSize: const Size(0, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50))),
  );
}
