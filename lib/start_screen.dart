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
                      child: GestureDetector(
                        onTap: () {
                          _btnAnimationController.isActive = true;
                          showGeneralDialog(
                              barrierDismissible: true,
                              //dismissable
                              barrierLabel: MaterialLocalizations.of(context)
                                  .modalBarrierDismissLabel,
                              barrierColor: Colors.black.withOpacity(0.5),
                              // Color of the barrier
                              transitionDuration: Duration(milliseconds: 300),
                              //shows the dialog box
                              context: context,
                              pageBuilder: (context, _, __) => Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40))),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.1,
                                          vertical: screenHeight * 0.17),
                                      child: Scaffold(
                                        resizeToAvoidBottomInset: true,
                                        backgroundColor: Colors.transparent,
                                        //allows to see back
                                        body: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 26, vertical: 18.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Sign In",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Poppins",
                                                    fontSize:
                                                        screenHeight * 0.04,
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Efficiently retrieve desired information with streamlined access to content through intuitive interface.",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w100,
                                                    fontSize:
                                                        screenHeight * 0.014,
                                                    decoration:
                                                        TextDecoration.none),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Align(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .centerStart,
                                                  child: Text(
                                                    "Email",
                                                    style: TextStyle(
                                                        fontSize: screenHeight *
                                                            0.018,
                                                        fontFamily: "Poppins"),
                                                  )),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                  width: screenWidth * 1.6,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Color(0xFFF5F5F5),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 24.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          CupertinoIcons.mail,
                                                          size: 30,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        SizedBox(
                                                            width: screenWidth *
                                                                0.43,
                                                            child:
                                                                TextFormField(
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Poppins"),
                                                              decoration: const InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "Email"),
                                                            )),
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Align(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .centerStart,
                                                  child: Text(
                                                    "Password",
                                                    style: TextStyle(
                                                        fontSize: screenHeight *
                                                            0.018,
                                                        fontFamily: "Poppins"),
                                                  )),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                  width: screenWidth * 1.6,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Color(0xFFF5F5F5),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 24.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          CupertinoIcons.lock,
                                                          size: 30,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        SizedBox(
                                                            width: screenWidth *
                                                                0.43,
                                                            child:
                                                                TextFormField(
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Poppins"),
                                                              decoration: const InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "Password"),
                                                            )),
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                width: screenWidth * 0.4,
                                                height: screenHeight * 0.06,
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                          Color(0xffFFB07F),
                                                        ),
                                                        elevation:
                                                            MaterialStatePropertyAll(
                                                                0)),
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text("Sign In",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontSize: screenHeight * 0.019,
                                                                color: Colors
                                                                    .black)),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Icon(CupertinoIcons
                                                            .arrow_right,color: Colors.black,size: screenHeight * 0.037,)
                                                      ],
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
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
