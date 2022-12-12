import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_module.dart';
import 'router.dart' as r;

class TrackingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: Color(0xFFF7F7F7),
          primaryColor: Color(0xFF1BA3AC),
          canvasColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backwardsCompatibility: false, // 1
            systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
          ),
          textTheme: TextTheme(
              bodyText1: const TextStyle(
                fontFamily: "Nunito-Regular",
                fontWeight: FontWeight.w400
              ),
              bodyText2: const TextStyle(
                fontFamily: "Nunito-Medium",
                fontWeight: FontWeight.w500
              ),
              caption: const TextStyle(
                fontFamily: "Nunito-Medium",
                fontWeight: FontWeight.w500
              ),
              headline1: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Nunito"),
              headline2: const TextStyle(fontSize: 14),
              button: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor
              )
          )
      ),
      onGenerateRoute: r.Router.generateRouter,
      initialRoute: r.Router.launcher,
    );
  }
}