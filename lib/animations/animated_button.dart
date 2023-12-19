import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({super.key, required this.btnAnimationController, required this.press});

  final RiveAnimationController btnAnimationController;
  final VoidCallback press;


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
