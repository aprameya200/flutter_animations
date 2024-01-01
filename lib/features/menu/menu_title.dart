import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuTitle extends StatelessWidget {
  const MenuTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 5),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 16,
            letterSpacing: 2),
      ),
    );
  }
}
