import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/global.dart';
import '../utils/global_state.dart';
import 'login.dart';

class Profile extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _Profile();
  }
}

final GlobalState store = GlobalState.instance;

class _Profile extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF7F7F7),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Container(
              color: const Color(0xffffffff),
                padding: const EdgeInsets.only(top: 110),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('AUFAR RAFDI', style: Global.getCustomFont(Global.BLACK, 22, 'bold')),
                )
            ),
            Container(
                color: const  Color(0xffffffff),
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Bandung', style: Global.getCustomFont(Global.BLACK, 18, 'medium')),
                )
            ),
            Container(
              color: const Color(0xffffffff),
              padding: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Color(0xffFCD713),
                          borderRadius: BorderRadius.circular(100)
                        //more than 50% of width makes circle
                      ),
                    ),
                    Container(
                      width: 11,
                    ),
                    Container(
                        color: const Color(0xffffffff),
                        padding: const EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Aktif', style: Global.getCustomFont(Global.BLACK, 15, 'medium')),
                        )
                    ),
                  ],
                )
              ),
            )
          ],
        )
    );
  }
}