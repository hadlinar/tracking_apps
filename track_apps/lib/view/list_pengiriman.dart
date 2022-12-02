import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/global.dart';
import '../utils/global_state.dart';
import 'login.dart';

class ListPengiriman extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _ListPengiriman();
  }
}

final GlobalState store = GlobalState.instance;

class _ListPengiriman extends State<ListPengiriman> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffffffff),
        child: Text('list pengiriman')
      )
    );
  }
}