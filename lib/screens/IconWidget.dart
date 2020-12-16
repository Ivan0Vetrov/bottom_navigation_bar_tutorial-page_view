import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget partyIcon(image) {
  return
    GestureDetector(
        onTap: null,
        child: Container(
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        "https://i.imgur.com/BoN9kdC.png")
                )
            ))

    );
}