import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animations/features/start/ui/external_sign_in_buttons.dart';
import 'package:flutter_animations/features/start/ui/sign_in_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    super.initState();
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
              width: screenWidth * 1.7,
              bottom: 200,
              left: 100,
              child: Image.asset("assets/Spline.png")),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            child: SizedBox(),
          )),
          const RiveAnimation.asset("assets/RiveAnimations/shapes.riv"),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: SizedBox(),
          )),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Container(
              width: screenWidth * 0.76,
              child: Column(
                children: [
                  Text(
                    "Learn design & code",
                    style: TextStyle(
                        fontSize: screenHeight * 0.07,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Design is a multifaceted discipline that encompasses the thoughtful creation and arrangement of elements to achieve.",
                    style: TextStyle(fontSize: screenHeight * 0.017),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Spacer(),
                  Container(
                      height: screenHeight * 0.085,
                      width: screenWidth * 1.6,
                      child: SignInDialogBox(btnAnimationController: _btnAnimationController, screenHeight: screenHeight, screenWidth: screenWidth,)),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: Text(
                      "By completing the course purchase, you agree to abide by the specified terms and condition.",
                      style: TextStyle(fontSize: screenHeight * 0.017),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
