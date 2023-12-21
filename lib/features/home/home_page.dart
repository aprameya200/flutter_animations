import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: SafeArea(
          child: Container(
              color: Colors.lime,
              height: screenHeight * 0.06,
              child: Row(
                children: [SizedBox(height: 50,width: 50,child: RiveAnimation.asset("assets/RiveAnimations/animated_set.riv",artboard: "HOME",onInit: (artboard){

                },))],
              ))),
    );
  }
}
