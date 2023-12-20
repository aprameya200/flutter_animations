import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/features/start/ui/sign_in_box.dart';
import 'package:flutter_animations/features/start/ui/start_course_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';

import 'external_sign_in_buttons.dart';

class SignInDialogBox extends StatelessWidget {
  const SignInDialogBox(
      {super.key,
      required this.btnAnimationController,
      required this.screenHeight,
      required this.screenWidth});

  final RiveAnimationController btnAnimationController;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        print("Heelo World");
        btnAnimationController.isActive = true;
        await Future.delayed(Duration(milliseconds: 800));
        showGeneralDialog(
            barrierDismissible: true,
            //dismissable
            barrierLabel: "Sign In",
            barrierColor: Colors.black.withOpacity(0.5),
            context: context,
            // Color of the barrier
            transitionDuration: Duration(milliseconds: 400),
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              Tween<Offset> tween;
              tween = Tween(begin: Offset(0, -1), end: Offset.zero);
              return SlideTransition(
                position: tween.animate(CurvedAnimation(
                    parent: animation, curve: Curves.easeInOut)),
                child: child,
              );
            },
            //shows the dialog box
            pageBuilder: (context, _, __) => Center(
                  child: SignInBox(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                ));
      },
      child: StartCourseButton(
          btnAnimationController: btnAnimationController,
          screenHeight: screenHeight,
          screenWidth: screenWidth),
    );
  }
}
