
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animations/constants.dart';
import 'package:flutter_animations/data.dart';
import 'package:flutter_animations/features/home/bottom_navigation_bar.dart';
import 'package:flutter_animations/features/home/courses_grid.dart';
import 'package:flutter_animations/features/home/home_page_elements.dart';
import 'package:flutter_animations/features/home/menu_button_widget.dart';
import 'package:flutter_animations/features/home/top_banner.dart';
import 'package:flutter_animations/features/menu/side_menu.dart';
import 'package:flutter_animations/utils/rive_asset.dart';
import 'package:flutter_animations/utils/rive_utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

import 'package:flutter_animations/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //animation controller for sidemenu navigation
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: 220),
    vsync: this,
  );

  late Animation<Offset> _offsetAnimation;
  late Animation<double> _scaleAnimation;

  RiveAsset selectedBottomNav = bottomNavs[2];
  RiveAsset prevAsset = bottomNavs[2];

  bool isSideMenuClosed = true;

  void openClose() {
    setState(() {
      isSideMenuClosed = !isSideMenuClosed;
      _controller.value == 1.0 ? _controller.reverse() : _controller.forward();
    });

    _controller.value == 1.0 ? changeSystemNavColor(pureWhite) : changeSystemNavColor(darkBlue);

  }

  @override
  void initState() {
    super.initState();
    changeSystemNavColor(Colors.white);

    // Create an OffsetTween from (0, 0) to (100, 100)
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(250, 0),
    ).animate(_controller);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8, // Adjust the end scale value as needed
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCirc,
    ));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      // body: Lottie.asset('assets/plant.json'),
      body: Stack(
        children: [
          Positioned(child: SideMenu()),
          Container(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _offsetAnimation.value, //maybechange this later
                  child: Container(
                    color: Color(0xFF213555),
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: ClipRRect(
                        borderRadius: isSideMenuClosed
                            ? BorderRadius.all(Radius.circular(0))
                            : BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          color: Colors.white,
                          child: HomeElements(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          /**
           * Animated Menu
           */
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: AnimatedBottomNavigationBar(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
          ),
          MenuButtonWidget(
            pressToOpen: openClose,
          ),
        ],
      ),
    );
  }
}
