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

  static Card getCardPengiriman(String noPengiriman, int color, String status, String date, String jmlhFaktur) {
    return Card(
        elevation: 5,
        shadowColor: const Color(0xffBCBCBC),
        // color: Color(color),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: SizedBox(
            width: 370,
            height: 130,
            child: Container(
              padding: const EdgeInsets.only(left: 12, top: 14),
              child: Column(
                children: [
                  Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 3),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(noPengiriman, style: Global.getCustomFont(Global.BLACK, 14, 'medium')),
                          ),
                        ),
                        //TODO warna status
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: const EdgeInsets.only(top: 3, bottom: 3, left: 9, right: 9),
                            child: Text(status, style: Global.getCustomFont(Global.WHITE, 14, 'bold')),
                            decoration: BoxDecoration(
                              //TODO
                                color: Color(color),
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        )
                      ],
                    ),
                  Container(
                    padding: const EdgeInsets.only(top: 14),
                    child: const Divider(
                      height: 2,
                      thickness: 0.8,
                      endIndent: 15,
                      color: Color(0xff878787),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(date, style: Global.getCustomFont(Global.BLACK, 14, 'medium')),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(jmlhFaktur + " faktur", style: Global.getCustomFont(Global.BLACK, 14, 'medium')),
                    ),
                  )
                ],
              )
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