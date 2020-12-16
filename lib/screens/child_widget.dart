import 'package:flutter/material.dart';

class ChildWidget extends StatelessWidget {
  final AvailableNumber number;

  const ChildWidget({Key key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String file = "";
    if (number == AvailableNumber.First) {
      file = "swipe";
    } else if (number == AvailableNumber.Second) {
      file = "plifer";
    } else if (number == AvailableNumber.Third) {
      file = "clubber";
    } else {
      file= "profile";
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$file ",
              style: TextStyle(fontSize: 36.0),
            ),

          ],
        ),
      ),
    );
  }
}

enum AvailableNumber { First, Second, Third, Forth }