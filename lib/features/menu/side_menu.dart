import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animations/features/menu/info_card.dart';
import 'package:rive/rive.dart';

import '../../constants.dart';
import '../../utils/rive_asset.dart';
import '../../utils/rive_utils.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedsideNav = sideNavs[0];
  RiveAsset prevAsset = sideNavs[0];

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: darkBlue,
        width: screenWidth * 0.7,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 15),
                child: Text(
                  "BROWSE",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 16,
                      letterSpacing: 2),
                ),
              ),
              Container(
                color: Colors.white10,
                // height: 1,
                width: screenWidth * 0.9,
              ),
              SizedBox(
                height: 20,
              ),
              ...List.generate(
                //feeds into the list as row children
                sideNavs.length,
                (index) => GestureDetector(
                  onTap: () {
                    // starts the animation
                    if (sideNavs[index] != selectedsideNav) {
                      sideNavs[index].input!.change(true);

                      setState(() {
                        prevAsset = selectedsideNav;
                        selectedsideNav = sideNavs[index];
                      });
                    }
                    Future.delayed(Duration(milliseconds: 500)).then((value) {
                      sideNavs[index]
                          .input!
                          .change(false); //stops the animation
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    //to increase the width since it wont touch
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                            height: screenHeight * 0.075,
                            width: sideNavs[index] == selectedsideNav
                                ? screenWidth * 0.6
                                : 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: bannerAndMenu,
                              ),
                            ),
                            duration: Duration(milliseconds: 200)),
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
                                style: TextStyle(
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
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 5),
                child: Text(
                  "HISTORY",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 16,
                      letterSpacing: 2),
                ),
              ),
              Container(
                color: Colors.white10,
                // height: 1,
                width: screenWidth * 0.9,
              ),
              ...List.generate(
                //feeds into the list as row children
                historyItems.length,
                (index) => GestureDetector(
                  onTap: () {
                    // starts the animation
                    if (historyItems[index] != selectedsideNav) {
                      historyItems[index].input!.change(true);

                      setState(() {
                        prevAsset = selectedsideNav;
                        selectedsideNav = historyItems[index];
                      });
                    }
                    Future.delayed(Duration(milliseconds: 500)).then((value) {
                      historyItems[index]
                          .input!
                          .change(false); //stops the animation
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    //to increase the width since it wont touch
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                            height: screenHeight * 0.07,
                            width: historyItems[index] == selectedsideNav
                                ? screenWidth * 0.6
                                : 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: bannerAndMenu,
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            duration: Duration(milliseconds: 200)),
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
                                    artboard: historyItems[index].artboard,
                                    //initial artboard to be displayed i.i  te icon
                                    onInit: (artboard) {
                                      //called when animation is ready to be displayed
                                      StateMachineController controller =
                                          RiveUtils.getRiveController(artboard,
                                              stateMachineName:
                                                  historyItems[index]
                                                      .stateMachineName);
                                      historyItems[index].input = controller
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
                                historyItems[index].title,
                                style: TextStyle(
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
                  ),
                ),
              ),
            ],
          ),
        ), // Set height to cover top to bottom
      ),
    );
  }
}
