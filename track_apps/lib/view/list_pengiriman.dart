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
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          backgroundColor: const Color(0xffF7F7F7),
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            title: Text(
                "Daftar Pengiriman",
                style: Global.getCustomFont(Global.TOSCA, 18, 'bold')
            ),
          ),
          body: Container(
            padding: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  child: Global.getCardPengiriman("TRK-2022-KP-0001", 0xff6FA9F7, "Barang belum dikirim", "16 Nov 2022, 13:57", "3"),
                )
              ],
            )
          )
      ),
    );
  }
}