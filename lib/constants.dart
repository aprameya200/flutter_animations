
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color darkBlue = const Color(0xFF213555);
Color pureWhite = Colors.white;
Color bannerAndMenu = const Color(0xFF146C94);
Color transparentWhite = const Color(0x6ffffff);

void changeSystemNavColor(Color color){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: color,
    statusBarIconBrightness: Brightness.light,
  ));
}

void changeSystemStatusBarColor(Color color){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color,
    statusBarIconBrightness: Brightness.light,
  ));
}