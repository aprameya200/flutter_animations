import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class StartCourseButton extends StatelessWidget {
  const StartCourseButton({super.key, required this.btnAnimationController, required this.screenHeight, required this.screenWidth});

  final RiveAnimationController btnAnimationController;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //adding controller to animate
      RiveAnimation.asset(
        "assets/RiveAnimations/button.riv",
        controllers: [btnAnimationController], //controller for this animation
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
    ]);
  }
}
