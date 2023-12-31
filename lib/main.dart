import 'package:flutter/material.dart';
import 'package:flutter_animations/features/home/home_page.dart';
import 'package:flutter_animations/features/menu/side_menu.dart';
import 'package:flutter_animations/features/start/ui/start_screen.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    changeSystemUiColor(pureWhite, bannerAndMenu);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
