import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    // TODO: implement initState
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

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));

    return Scaffold(
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
                      child: GestureDetector(
                        onTap: () {
                          _btnAnimationController.isActive = true;
                          showGeneralDialog( //shows the dialog box
                              context: context,
                              pageBuilder: (context, _, __) => Container(
                                height: 100,
                                    width: 300,
                                    color: Colors.red,
                                    child: Text("AA"),
                                  ));
                        },
                        child: Stack(children: [
                          //adding controller to animate
                          RiveAnimation.asset(
                            "assets/RiveAnimations/button.riv",
                            controllers: [_btnAnimationController],
                          ),
                          Positioned.fill(
                              top: screenHeight * 0.01,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.arrow_right,
                                    size: screenHeight * 0.036,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Start Course",
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.024,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ))
                        ]),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: Text(
                      "By completing the course purchase, you agree to abide by the specified terms and condition.",
                      style: TextStyle(fontSize: screenHeight * 0.017),
                    ),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
