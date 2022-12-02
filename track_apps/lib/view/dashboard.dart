import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:track_apps/view/list_pengiriman.dart';
import 'package:track_apps/view/profile.dart';
import '../utils/global.dart';
import '../utils/global_state.dart';
import 'login.dart';

class Dashboard extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _Dashboard();
  }
}

final GlobalState store = GlobalState.instance;

class _Dashboard extends State<Dashboard> {
  String? defaultValue;
  List<String> filterStat = [
    'Harian',
    'Bulanan'
  ];

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
      body: SingleChildScrollView(
        child: Column(
            children: <Widget> [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    // height: 400,
                    child: SvgPicture.asset(
                        'assets/images/home.svg',
                        fit: BoxFit.cover,
                      height: 325,
                      ),
                  ),
                  Column(
                    children: [
                      //TODO
                      Container(
                          padding: const EdgeInsets.only(left: 49, top: 95),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('AUFAR RAFDI', style: Global.getCustomFont(Global.WHITE, 22, 'bold')),
                          )
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 49, top: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Bandung', style: Global.getCustomFont(Global.WHITE, 19, 'medium')),
                          )
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 31, top: 77, right: 31),
                        child: Row(
                          children: [
                            Stack(
                              children: <Widget>[
                                Global.getMenuCard("pelanggan.png", 0xffFFFFFF),
                                //TODO
                                Container(
                                    padding: const EdgeInsets.only(left: 22, top: 89),
                                    child: Text('3', style: Global.getCustomFont(Global.BLACK, 22, 'medium'))
                                ),
                                Container(
                                    padding: const EdgeInsets.only(left: 22, top: 120),
                                    child: Global.getMenuText("pelanggan")
                                )
                              ],
                            ),
                            Container(
                              width: 26
                            ),
                            Stack(
                              children: <Widget>[
                                Global.getMenuCard("pengiriman.png", 0xffFFFFFF),
                                //TODO
                                Container(
                                    padding: const EdgeInsets.only(left: 22, top: 89),
                                    child: Text('2', style: Global.getCustomFont(Global.BLACK, 22, 'medium'))
                                ),
                                Container(
                                    padding: const EdgeInsets.only(left: 22, top: 120),
                                    child: Global.getMenuText("pengiriman")
                                )
                              ],
                            ),
                          ],
                        )
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 31, top: 12, right: 31),
                        child: Row(
                          children: [
                            Stack(
                              children: <Widget>[
                                Global.getMenuCard("jam.png", 0xffFFFFFF),
                                //TODO
                                Container(
                                    padding: const EdgeInsets.only(left: 22, top: 89),
                                    child: Text('5', style: Global.getCustomFont(Global.BLACK, 22, 'medium'))
                                ),
                                Container(
                                    padding: const EdgeInsets.only(left: 22, top: 120),
                                    child: Global.getMenuText("jam perjalanan")
                                )
                              ],
                            ),
                            Container(
                              width: 26
                            ),
                            Stack(
                              children: <Widget>[
                                Global.getMenuCard("faktur.png", 0xffFFFFFF),
                                //TODO
                                Container(
                                    padding: const EdgeInsets.only(left: 22, top: 89),
                                    child: Text('3', style: Global.getCustomFont(Global.BLACK, 22, 'medium'))
                                ),
                                Container(
                                    padding: const EdgeInsets.only(left: 22, top: 120),
                                    child: Global.getMenuText("faktur")
                                )
                              ],
                            ),
                          ],
                        )
                      ),
                      //TODO
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            padding: const EdgeInsets.only(top: 72, right: 21, left: 21, bottom: 33),
                            width: 172,
                            child: DropdownButtonFormField<String>(
                              hint: const Text("filter"),
                              dropdownColor: Colors.white,
                              style: Global.getCustomFont(Global.BLACK, 15, 'medium'),
                              value: defaultValue,
                              items: filterStat.map((e) {
                                return DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  defaultValue = value;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only( top: 10, bottom: 10, left: 12, right: 12),
                                labelText: "Filter",
                                labelStyle: const TextStyle(
                                    color: Color(0xff757575),
                                    fontSize: 15,
                                    fontFamily: 'bold'),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    borderSide: BorderSide()
                                ),
                              ),
                            )
                        ),
                      //   defaultType == "In-office" ? Container(
                      //       child: InOffice(
                      //           defaultType!
                      //       )
                      //   )
                      //       : (defaultType == "Out-office" ? Container(
                      //       child: OutOffice()
                      //   )
                      //       : (defaultType == "Off" ? Container(
                      //       child: Off()
                      //   ) : Container()))
                      //   ],
                      // )
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}