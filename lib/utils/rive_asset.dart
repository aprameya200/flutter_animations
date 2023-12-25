import 'package:flutter/cupertino.dart';
import 'package:flutter_animations/utils/rive_utils.dart';
import 'package:rive/rive.dart';

class RiveAsset{

  RiveAsset(this.src, {required this.artboard, required this.stateMachineName, required this.title,
      this.input});

  final String src;
  final String artboard;
  final String stateMachineName;
  final String title;
  late SMIBool? input;

   set setInput (SMIBool status){
     input = status;
   }

}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/RiveAnimations/animated_set.riv",artboard: 'SETTINGS', stateMachineName: 'SETTINGS_Interactivity', title: 'Settings'),
  RiveAsset("assets/RiveAnimations/animated_set.riv",artboard: 'SEARCH', stateMachineName: 'SEARCH_Interactivity', title: 'Search'),
  RiveAsset("assets/RiveAnimations/animated_set.riv",artboard: 'HOME', stateMachineName: 'HOME_interactivity', title: 'Home'),
  RiveAsset("assets/RiveAnimations/animated_set.riv",artboard: 'USER', stateMachineName: 'USER_Interactivity', title: 'User'),
  RiveAsset("assets/RiveAnimations/animated_set.riv",artboard: 'CHAT', stateMachineName: 'CHAT_Interactivity', title: 'Chat'),
];

