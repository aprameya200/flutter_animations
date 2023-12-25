import 'package:auto_size_text/auto_size_text.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animations/data.dart';
import 'package:flutter_animations/features/home/bottom_navigation_bar.dart';
import 'package:flutter_animations/utils/rive_asset.dart';
import 'package:flutter_animations/utils/rive_utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RiveAsset selectedBottomNav = bottomNavs[2];
  RiveAsset prevAsset = bottomNavs[2];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Color(0xFF213555)));

    return Scaffold(
      // body: Lottie.asset('assets/plant.json'),

      body: SafeArea(
        child: Container(
          height: screenHeight,
          child: Stack(
            children: [
              Container(
                height: screenHeight * 0.4,
                width: screenWidth,
                color: Color(0xFF213555),
                child: Stack(
                  children: [
                    Positioned.fill(
                        top: screenHeight * 0.013,
                        right: -5,
                        child: Lottie.asset('assets/plant.json',
                            height: screenHeight * 0.019)),
                    Positioned(
                      top: 30,
                      left: 50,
                      right: 90,
                      child: Container(
                        width: screenWidth * 0.8,
                        child: Text(
                          "Hey, What would you like to learn today ?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.033,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.23,
                      left: 40,
                      right: 40,
                      child: const SearchBar(
                        hintText: "Search Here",
                        leading: Icon(CarbonIcons.search),
                        textStyle: MaterialStatePropertyAll(
                            TextStyle(fontFamily: "Poppins")),
                        elevation: MaterialStatePropertyAll(0),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 6, horizontal: 20)),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: screenHeight * 0.3,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 20,bottom: 120),
                      height: screenHeight * 0.7,
                      width: screenWidth,
                      color: Colors.transparent,
                      child: StaggeredGridView.countBuilder( //each item is list can have different size
                        //controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        itemCount: CourseTopics.allTopics.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: index == 1 ? EdgeInsets.only(top: 60,left: 12,right: 12,bottom: 12) : EdgeInsets.only(top: 10,left: 12,right: 4,bottom: 12) ,
                            child: Card(
                              color: Colors.white,
                              elevation: 3,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 12),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,children: [
                                    Image.asset("assets/${CourseTopics.allTopics[index].imageName}",height: screenHeight * 0.13,width: screenWidth * 0.25,),
                                    AutoSizeText(CourseTopics.allTopics[index].topicName,style: TextStyle(fontFamily: "Poppins",fontSize: screenHeight * 0.03),maxLines: 1,),
                                    Text("12 Courses",style: TextStyle(fontFamily: "Poppins",fontSize: 13,color: Colors.black54))
                                  ],),
                                ),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (int index) =>
                            const StaggeredTile.fit(1),
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedBottomNavigationBar(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ))
            ],
          ),
        ),
      ),
    );
    // bottomNavigationBar: AnimatedBottomNavigationBar(
    //   screenHeight: screenHeight,
    //   screenWidth: screenWidth,
    // ));
  }
}
