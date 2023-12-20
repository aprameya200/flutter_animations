import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/features/start/ui/sign_in_box.dart';
import 'package:flutter_animations/features/start/ui/start_course_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';

import 'external_sign_in_buttons.dart';

class SignInDialogBox extends StatelessWidget {
  const SignInDialogBox({super.key, required this.btnAnimationController, required this.screenHeight, required this.screenWidth});

  final RiveAnimationController btnAnimationController;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        btnAnimationController.isActive = true;
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
              child: SignInBox(screenWidth: screenWidth, screenHeight: screenHeight,),
            ));
      },
      child: StartCourseButton(btnAnimationController: btnAnimationController, screenHeight: screenHeight, screenWidth: screenWidth),
    );
  }
}
