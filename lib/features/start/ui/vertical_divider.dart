import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogDivider extends StatelessWidget {
  const DialogDivider({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.black38,
          height: 1,
          width: screenWidth * 0.3,
        ),
        SizedBox(
          width: 5,
        ),
        Text("Or"),
        SizedBox(
          width: 5,
        ),
        Container(
          color: Colors.black38,
          height: 1,
          width: screenWidth * 0.3,
        )
      ],
    );
  }
}
