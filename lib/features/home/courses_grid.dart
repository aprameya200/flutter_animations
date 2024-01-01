import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../data.dart';

class CoursesGrid extends StatefulWidget {
  const CoursesGrid({super.key, required this.screenHeight, required this.screenWidth});

  final double screenHeight ;
  final double screenWidth ;

  @override
  State<CoursesGrid> createState() => _CoursesGridState();
}

class _CoursesGridState extends State<CoursesGrid> {

  @override
  Widget build(BuildContext context) {

    double screenHeight = widget.screenHeight ;
    double screenWidth = widget.screenWidth ;

    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Container(color: Colors.transparent,
            padding: EdgeInsets.only(bottom: 80),
            height: screenHeight * 0.65,
            width: screenWidth,
            child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.zero,
              //each item is list can have different size
              //controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              itemCount: CourseTopics.allTopics.length,
              itemBuilder: (BuildContext context, int index) {
                return displayCard(index, screenHeight, screenWidth); //display card
              },
              staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
            ),
          ),
        ));
  }
  
  Widget displayCard(int index,double screenHeight,double screenWidth){
    return Padding(
      padding: index == 1
          ? const EdgeInsets.only(
          top: 60, left: 12, right: 12, bottom: 12)
          : const EdgeInsets.only(
          top: 10, left: 12, right: 4, bottom: 12),
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 24.0, vertical: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/${CourseTopics.allTopics[index].imageName}",
                  height: screenHeight * 0.13,
                  width: screenWidth * 0.25,
                ),
                AutoSizeText(
                  CourseTopics.allTopics[index].topicName,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: screenHeight * 0.03),
                  maxLines: 1,
                ),
                const Text("12 Courses",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        color: Colors.black54))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
