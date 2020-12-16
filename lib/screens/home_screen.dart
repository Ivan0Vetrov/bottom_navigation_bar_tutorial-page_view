import 'package:bottom_navigation_bar_tutorial/screens/child_widget.dart';
import 'package:bottom_navigation_bar_tutorial/screens/clubber.dart';
import 'package:bottom_navigation_bar_tutorial/screens/chat.dart';
import 'package:bottom_navigation_bar_tutorial/screens/swipe.dart';
import 'package:flutter/material.dart';

import 'package:bottom_navigation_bar_tutorial/screens/IconWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _pageController = PageController(
    initialPage: 0,
  );
  int currentIndex = 0;

  Widget childWidget = ChildWidget(
    number: AvailableNumber.First,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
         actions:[Expanded(child:Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [


           Container(child: GestureDetector(
             onTap: () {
               if (currentIndex !=0){
                 currentIndex = 0;
                 _pageController.animateToPage(
                   currentIndex,
                   duration: Duration(milliseconds: 200),
                   curve: Curves.linear,
                 );

                 setState(() {});
               }},

             child: Icon(
               Icons.swipe,
               size: 50,
               color: (currentIndex==0) ? Colors.amber : Colors.grey,
             ),

           ),
           ),

           Container(child: GestureDetector(
             onTap: () {
               if (currentIndex !=1){
                 currentIndex = 1;
                 _pageController.animateToPage(
                   currentIndex,
                   duration: Duration(milliseconds: 200),
                   curve: Curves.linear,
                 );

                 setState(() {});
               }},

             child: Icon(
               Icons.chat,
               size: 50,
               color: (currentIndex==1) ? Colors.amber : Colors.grey,
             ),

           ),
           ),

           Container(child: GestureDetector(
             onTap: () {
               if (currentIndex !=2){
                 currentIndex = 2;
                 _pageController.animateToPage(
                   currentIndex,
                   duration: Duration(milliseconds: 200),
                   curve: Curves.linear,
                 );

                 setState(() {});
               }},

             child: Icon(
               Icons.phonelink_lock,
               size: 50,
               color: (currentIndex==2) ? Colors.amber : Colors.grey,
             ),

           ),
           ),

           Container(child: GestureDetector(
             onTap: () {
               if (currentIndex !=3){
                 currentIndex = 3;
                 _pageController.animateToPage(
                   currentIndex,
                   duration: Duration(milliseconds: 200),
                   curve: Curves.linear,
                 );

                 setState(() {});
               }},

             child: Icon(
               Icons.person,
               size: 50,
               color: (currentIndex==3) ? Colors.amber : Colors.grey,
             ),

           ),
           )
         ],
         ))
         ]
      ),

      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget>[
          ExampleHomePage(),
          Chat(),
          Clubber(),
          ChildWidget(number: AvailableNumber.Forth)
        ],
      )

    );
  }
}