import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExternalSignInButtons extends StatelessWidget {
  const ExternalSignInButtons({super.key,required this.icon, required this.screenHeight});

  final IconData? icon;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {print("asda");},
      focusColor: Colors.red,// Adjust the splash color as needed
      child: Container(
          decoration: BoxDecoration(
              color: Color(0xc3ffb07f),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.all(6),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: screenHeight * 0.03,
            ),
          )),
    );
  }
}
