import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:track_apps/view/list_pengiriman/detail_pengiriman.dart';
import '../../utils/global.dart';
import '../../utils/global_state.dart';

class ListFaktur extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _ListFaktur();
  }
}

final GlobalState store = GlobalState.instance;

class _ListFaktur extends State<ListFaktur> {

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
            leading: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: ImageIcon(
                  const AssetImage('assets/icons/back.png'),
                  color: Color(Global.TOSCA),
                  size: 18,
                )
            ),
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
                  //TODO
                  Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailFaktur(),
                            ),
                          );
                        },
                        child: Global.getCardFaktur("FKT/BDG/2022/00000130", "30055011", "MUSTAJAB 2, TO", "JL.T.HASAN DEK,GP.LAMSEUPENG"),
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Align(
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(top: 9, bottom: 9),
                                width: 163,
                                height: 56,
                                color: const Color(0xffF7F7F7),
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Color(Global.GREEN)),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    color: Color(Global.GREEN),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Global.defaultModal(() {
                                              Navigator.pop(context);
                                            }, context, Global.WARNING_ICON, "swelesweleswele", "Ok", true);
                                          }
                                      );
                                    },
                                    child: const Text(
                                      "Mulai Pengiriman",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'bold',
                                          fontSize: 15
                                      ),
                                    )
                                ),
                              ),
                            ]
                        )
                    ),
                  ),
                ],
              )
          )
      ),
    );
  }
}