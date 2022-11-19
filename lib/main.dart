import 'package:chatbook/config/pallette.dart';
import 'package:chatbook/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'screens/nav_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ChatBook App UI",
      theme: ThemeData(
          scaffoldBackgroundColor: Palette.scaffold,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: NavScreen(),
    );
  }
}
