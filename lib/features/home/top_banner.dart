import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../constants.dart';
import 'menu_button_widget.dart';

class TopBanner extends StatefulWidget {
  const TopBanner({super.key, required this.screenHeight, required this.screenWidth});

  final double screenHeight;
  final double screenWidth;

  @override
  State<TopBanner> createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  @override
  Widget build(BuildContext context) {

    return Container(padding: EdgeInsets.only(top: 42),
      height: widget.screenHeight * 0.4,
      width: widget.screenWidth,
      color: bannerAndMenu,
      child: Stack(
        children: [
          Positioned.fill(
              top: widget.screenHeight * 0.013,
              right: -5,
              child: Lottie.asset('assets/plant.json',
                  height: widget.screenHeight * 0.019)),
          Positioned(
            top: 45,
            left: 50,
            right: 90,
            child: Container(
              width: widget.screenWidth * 0.8,
              child: Text(
                "Hey, What would you like to learn today ?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.screenHeight * 0.033,
                    fontFamily: "Poppins"),
              ),
            ),
          ),
          Positioned(
            top: widget.screenHeight * 0.23,
            left: 40,
            right: 40,
            child: const SearchBar(
              hintText: "Search Here",
              leading: Icon(CarbonIcons.search),
              textStyle: MaterialStatePropertyAll(
                  TextStyle(fontFamily: "Poppins")),
              elevation: MaterialStatePropertyAll(0),
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 6, horizontal: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
