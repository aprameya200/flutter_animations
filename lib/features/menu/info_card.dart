import 'dart:ffi';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            CarbonIcons.user_avatar,
            size: 45,color: Colors.white,
          ),
          SizedBox(width: 7,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Ram Thapa",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: "Poppins"),), Text("Youtuber",style: TextStyle(fontFamily: "Poppins",color: Colors.white),)],
          )
        ],
      ),
    );
  }
}
