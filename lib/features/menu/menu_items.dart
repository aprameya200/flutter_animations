import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../constants.dart';
import '../../utils/rive_asset.dart';
import '../../utils/rive_utils.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key, required this.index, required this.selectedsideNav, required this.sideNavs});

  final int index;
  final RiveAsset selectedsideNav;
  final List<RiveAsset> sideNavs;

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.transparent,
      //to increase the width since it wont touch
      child: Stack(
        children: [
          AnimatedPositioned(
              height: screenHeight * 0.075,
              width: sideNavs[index] == selectedsideNav
                  ? screenWidth * 0.6
                  : 0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: bannerAndMenu,
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight * 0.075,
                  width: screenWidth * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: RiveAnimation.asset(
                      sideNavs.first.src,
                      //asset source string
                      artboard: sideNavs[index].artboard,
                      //initial artboard to be displayed i.i  te icon
                      onInit: (artboard) {
                        //called when animation is ready to be displayed
                        StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: sideNavs[index]
                                .stateMachineName);
                        sideNavs[index].input = controller
                            .findSMI("active")
                        as SMIBool; //finds the instance of SMI
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  sideNavs[index].title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: "Poppins"),
                ),
              ],
            ),
          ),
          Container(
            color: transparentWhite,
            height: 1,
            width: screenWidth * 0.9,
          ),
        ],
      ),
    );
  }
}
