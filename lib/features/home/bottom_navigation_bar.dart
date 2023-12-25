import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../utils/rive_asset.dart';
import '../../utils/rive_utils.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  const AnimatedBottomNavigationBar({super.key, required this.screenHeight, required this.screenWidth});

  final double screenHeight;
  final double screenWidth;

  @override
  State<AnimatedBottomNavigationBar> createState() => _AnimatedBottomNavigationBarState();
}

class _AnimatedBottomNavigationBarState extends State<AnimatedBottomNavigationBar> {

  RiveAsset selectedBottomNav = bottomNavs[2];
  RiveAsset prevAsset = bottomNavs[2];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
          child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color(0xFF213555),
                  borderRadius: BorderRadius.circular(18)),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    //feeds into the list as row children
                    bottomNavs.length,
                        (index) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //starts the animation
                            if (bottomNavs[index] != selectedBottomNav) {
                              bottomNavs[index].input!.change(true);

                              setState(() {
                                prevAsset = selectedBottomNav;
                                selectedBottomNav = bottomNavs[index];
                              });
                            }
                            Future.delayed(Duration(milliseconds: 500))
                                .then((value) {
                              bottomNavs[index]
                                  .input!
                                  .change(false); //stops the animation
                            });
                          },
                          child: SizedBox(
                              height: 42,
                              width: widget.screenWidth * 0.1,
                              child: Opacity(
                                opacity: bottomNavs[index] == selectedBottomNav
                                    ? 1
                                    : 0.5,
                                child: RiveAnimation.asset(
                                  bottomNavs.first.src,
                                  //asset source string
                                  artboard: bottomNavs[index].artboard,
                                  //initial artboard to be displayed i.i  te icon
                                  onInit: (artboard) {
                                    //called when animation is ready to be displayed
                                    StateMachineController controller =
                                    RiveUtils.getRiveController(artboard,
                                        stateMachineName: bottomNavs[index]
                                            .stateMachineName);
                                    bottomNavs[index].input = controller
                                        .findSMI("active")
                                    as SMIBool; //finds the instance of SMI
                                  },
                                ),
                              )),
                        ),
                        AnimatedContainer(
                          transformAlignment: Alignment.centerLeft,
                          //displays an animated container
                          duration: Duration(milliseconds: 100),
                          height: bottomNavs[index] == selectedBottomNav ? widget.screenWidth * 0.014 : 0,
                          width: widget.screenWidth * 0.1,
                          decoration: BoxDecoration(
                            // color: Color(0xff91C8E4),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
