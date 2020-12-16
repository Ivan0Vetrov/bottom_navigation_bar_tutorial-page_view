import 'package:bottom_navigation_bar_tutorial/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navigation_bar_tutorial/screens/IconWidget.dart';
import 'package:bottom_navigation_bar_tutorial/screens/clubber.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeScreen()    );
  }
}