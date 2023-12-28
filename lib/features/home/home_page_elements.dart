import 'package:flutter/cupertino.dart';
import 'package:flutter_animations/features/home/top_banner.dart';

import 'courses_grid.dart';

class HomeElements extends StatefulWidget {
  const HomeElements({super.key, required this.screenHeight, required this.screenWidth});

  final double screenHeight;
  final double screenWidth;

  @override
  State<HomeElements> createState() => _HomeElementsState();
}

class _HomeElementsState extends State<HomeElements> {
  @override
  Widget build(BuildContext context) {

    double screenHeight = widget.screenHeight;
    double screenWidth = widget.screenWidth;

    return Container(height: screenHeight,width: screenWidth,
      child: Stack(children: [
        /**
         * top banner
         */
        TopBanner(screenHeight: screenHeight, screenWidth: screenWidth),
        /**
         * Courses Grid
         */
        CoursesGrid(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
        ),
      ],),
    );
  }
}
