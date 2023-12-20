import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/features/start/ui/vertical_divider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'external_sign_in_buttons.dart';

class SignInBox extends StatelessWidget {
  const SignInBox({super.key, required this.screenWidth, required this.screenHeight});

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(40))),
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1,
          vertical: screenHeight * 0.2),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        //allows to see back
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 26, vertical: 18.0),
            child: Column(
              children: [
                /**
                 * Top Sign In Button
                 */
                Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontSize:
                      screenHeight * 0.036,
                      decoration:
                      TextDecoration.none),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                /**
                 * Top Sign in long text
                 */
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
                  height: screenHeight * 0.01,
                ),

                /**
                 * Text Box Starts here
                 */
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
                  height: screenHeight * 0.01,
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
                            size: screenHeight *
                                0.034,
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
                                    fontSize: screenHeight * 0.017,
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
                  height: screenHeight * 0.015,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.lock,
                            size: screenHeight *
                                0.034,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width:
                              screenWidth *
                                  0.43,
                              // height: screenHeight * 0.05,
                              child:
                              TextFormField(

                                style: TextStyle(
                                    fontSize: screenHeight * 0.017,

                                    fontFamily:
                                    "Poppins"),
                                decoration:  InputDecoration(
                                  // contentPadding: EdgeInsets.only(top: screenHeight * 0.00007), // Adjust top padding as needed
                                    border:
                                    InputBorder
                                        .none,
                                    hintText:
                                    "Password"),
                              )),
                        ],
                      ),
                    )),
                /**
                 * Text Input fields ends here
                 */
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                /**
                 * SignIn Button
                 */
                SizedBox(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.05,
                  child: ElevatedButton(
                      style: ElevatedButton
                          .styleFrom(
                        backgroundColor:
                        Color(0xffFFB07F),
                        foregroundColor:
                        Colors.red,
                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              15.0), // Adjust the radius as needed
                        ),
                      ),
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
                                  fontSize:
                                  screenHeight *
                                      0.024,
                                  color: Colors
                                      .black)),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            CupertinoIcons
                                .arrow_right,
                            color: Colors.black,
                            size: screenWidth *
                                0.057,
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                DialogDivider(screenWidth: screenWidth),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text(
                  "Sign Up with Google, Facebook or Apple",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize:
                      screenWidth * 0.028),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                /**
                 * Sign in options
                 */
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceAround,
                  children: [
                    ExternalSignInButtons(
                      screenHeight: screenHeight,
                      icon:
                      FontAwesomeIcons.google,
                    ),
                    ExternalSignInButtons(
                      screenHeight: screenHeight,
                      icon: FontAwesomeIcons
                          .facebookF,
                    ),
                    ExternalSignInButtons(
                      screenHeight: screenHeight,
                      icon:
                      FontAwesomeIcons.apple,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
