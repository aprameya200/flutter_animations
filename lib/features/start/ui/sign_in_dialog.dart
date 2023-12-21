import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/features/start/ui/sign_in_box.dart';
import 'package:flutter_animations/features/start/ui/start_course_button.dart';
import 'package:rive/rive.dart';

class SignInDialogBox extends StatefulWidget {
  const SignInDialogBox({
    super.key,
    required this.btnAnimationController,
    required this.screenHeight,
    required this.screenWidth,
  });

  final RiveAnimationController btnAnimationController;
  final double screenHeight;
  final double screenWidth;

  @override
  State<SignInDialogBox> createState() => _SignInDialogBoxState();
}

class _SignInDialogBoxState extends State<SignInDialogBox> {
  bool isDialogInProgress = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDialogInProgress) {
          return; // Do nothing if the dialog is already in progress
        }
        widget.btnAnimationController.isActive = true; //sets the animation as active after tap

        setState(() {
          isDialogInProgress = true;
        });

        Future.delayed(const Duration(milliseconds: 750)).then((value) {
          showGeneralDialog(
            barrierDismissible: true,
            barrierLabel: "Sign In",
            barrierColor: Colors.black.withOpacity(0.5),
            context: context,
            transitionDuration: const Duration(milliseconds: 400),
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              Tween<Offset> tween;
              tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
              return SlideTransition( //transitiobn
                position: tween.animate(CurvedAnimation(
                    parent: animation, curve: Curves.easeInOut)),
                child: child,
              );

              // Tween<double> scaleTween = Tween<double>(begin: 0.0, end: 1.0); // Example values, adjust as needed
              //
              // return ScaleTransition(
              //   scale: scaleTween.animate(ProxyAnimation(animation)),
              //   child: child,
              // );
            },
            pageBuilder: (context, _, __) => Center(
              child: SignInBox(
                screenWidth: widget.screenWidth,
                screenHeight: widget.screenHeight,
              ),
            ),
          ).then((_) {
            setState(() {
              isDialogInProgress = false; //after dialog is completed it is set to false
            });
          });
        });
      },
      child: StartCourseButton(
        btnAnimationController: widget.btnAnimationController,
        screenHeight: widget.screenHeight,
        screenWidth: widget.screenWidth,
      ),
    );
  }
}
