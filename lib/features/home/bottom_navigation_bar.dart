import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import '../../constants.dart';
import '../../utils/rive_asset.dart';
import '../../utils/rive_utils.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  const AnimatedBottomNavigationBar({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  State<AnimatedBottomNavigationBar> createState() =>
      _AnimatedBottomNavigationBarState();
}

class _AnimatedBottomNavigationBarState
    extends State<AnimatedBottomNavigationBar> {
  RiveAsset selectedBottomNav = bottomNavs[2];
  RiveAsset prevAsset = bottomNavs[2];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: bannerAndMenu,
            borderRadius: BorderRadius.circular(18),
          ),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (final bottomNav in bottomNavs)
                buildBottomNavItem(bottomNav),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavItem(RiveAsset bottomNav) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildGestureDetector(bottomNav),
        buildAnimatedContainer(bottomNav),
      ],
    );
  }

  Widget buildGestureDetector(RiveAsset bottomNav) {
    return GestureDetector(
      onTap: () => handleNavItemTap(bottomNav),
      child: SizedBox(
        height: 42,
        width: widget.screenWidth * 0.13, // Replace with a constant
        child: Opacity(
          opacity: bottomNav == selectedBottomNav ? 1 : 0.5,
          child: RiveAnimation.asset(
            bottomNav.src,
            artboard: bottomNav.artboard,
            onInit: (artboard) {
              StateMachineController controller = RiveUtils.getRiveController(
                artboard,
                stateMachineName: bottomNav.stateMachineName,
              );
              bottomNav.input = controller.findSMI("active") as SMIBool;
            },
          ),
        ),
      ),
    );
  }

  Widget buildAnimatedContainer(RiveAsset bottomNav) {
    return AnimatedContainer(
      transformAlignment: Alignment.centerLeft,
      duration: const Duration(milliseconds: 100),
      height: bottomNav == selectedBottomNav
          ? widget.screenWidth * 0.01
          : 0,
      width: widget.screenWidth * 0.1, // Replace with a constant
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  void handleNavItemTap(RiveAsset bottomNav) {
    if (bottomNav != selectedBottomNav) {
      bottomNav.input!.change(true);
      setState(() {
        prevAsset = selectedBottomNav;
        selectedBottomNav = bottomNav;
      });
    }
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      bottomNav.input!.change(false);
    });
  }
}
