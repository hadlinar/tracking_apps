import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Global {
  static const String baseURL = "http://localhost:5000";

  static int TOSCA = 0xff1BA3AC;
  static int LIGHT_TOSCA = 0xff1CBAC5;
  static int GREEN = 0xff04D90D;
  static int YELLOW = 0xffFCD713;
  static int GREY = 0xff656565;
  static int LIGHT_GREY = 0xff878787;
  static int RED = 0xffFF0000;
  static int BLACK = 0xff000000;
  static int WHITE = 0xffFFFFFF;

  static String ACCESS_TOKEN = "access_token";

  static void setState(Null Function() param0) {}

  static TextStyle getCustomFont(int color, double fontSize, String fontName) {
    return TextStyle(
        color: Color(color),
        fontFamily: fontName,
        fontSize: fontSize);
  }

  static Text getDefaultText(String textToShown, int color) {
    return Text(
        textToShown,
        style: TextStyle(
            color: Color(color),
            fontFamily: 'medium',
            fontSize: 15
        )
    );
  }

  static Card getMenuCard(String imageCard, int color) {
    return Card(
        elevation: 5,
        shadowColor: const Color(0xffBCBCBC),
        color: Color(color),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: SizedBox(
            width: 151,
            height: 151,
            child: Container(
              padding: const EdgeInsets.only(top: 22, left: 12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/icons/$imageCard',
                  height: 68,
                  width: 68
                ),
              ),
            )
        )
    );
  }

  static Text getMenuText(String textToShown) {
    return Text(
      textToShown,
      style: Global.getCustomFont(Global.LIGHT_GREY, 16, 'regular'),
    );
  }
}