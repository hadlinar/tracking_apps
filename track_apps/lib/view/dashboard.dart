import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:track_apps/bloc/pengiriman_faktur/pengiriman_faktur_bloc.dart';
import 'package:track_apps/bloc/user/user_bloc.dart';
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
  String idLoper = store.get("id");
  List<String> filterStat = [
    'Harian',
    'Bulanan'
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(GetUserEvent());
  }

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
      body: BlocBuilder<UserBloc, UserBlocState>(
        builder: (context, state) {
          if(state is GetUserState) {
            store.set("id", state.getUser.id.toString());
            if(defaultValue == 'Harian' || defaultValue == null) {
              BlocProvider.of<PengirimanFakturBloc>(context).add(GetRekapEvent(state.getUser.id.toString(), "Harian"));
            } else {
              BlocProvider.of<PengirimanFakturBloc>(context).add(GetRekapEvent(state.getUser.id.toString(), defaultValue!));
            }
            return SingleChildScrollView(
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
                            Container(
                                padding: const EdgeInsets.only(left: 49, top: 95),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(state.getUser.nama, style: Global.getCustomFont(Global.WHITE, 22, 'bold')),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 49, top: 8),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(state.getUser.branch, style: Global.getCustomFont(Global.WHITE, 19, 'medium')),
                                )
                            ),
                            BlocBuilder<PengirimanFakturBloc, PengirimanFakturBlocState>(
                              builder: (context, state) {
                                if(state is InitialPengirimanFakturBlocState || state is LoadingPengirimanFakturState) {
                                  return Container(
                                    child: const Center(
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1BA3AC)),
                                        )
                                    ),
                                  );
                                }
                                if(state is GetRekapState) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 31, left: 31),
                                      padding: const EdgeInsets.only(top: 77),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: <Widget>[
                                                Global.getMenuCard("faktur.png", 0xffFFFFFF),
                                                Container(
                                                    padding: const EdgeInsets.only(left: 22, top: 79),
                                                    child: Text(state.getRekap.faktur, style: Global.getCustomFont(Global.BLACK, 20, 'medium'))
                                                ),
                                                Container(
                                                    padding: const EdgeInsets.only(left: 22, top: 110),
                                                    child: Global.getMenuText("faktur")
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                              width: 26
                                          ),
                                          Expanded(
                                            child: Stack(
                                              children: <Widget>[
                                                Global.getMenuCard("pengiriman.png", 0xffFFFFFF),
                                                Container(
                                                    padding: const EdgeInsets.only(left: 22, top: 79),
                                                    child: Text(state.getRekap.pengiriman, style: Global.getCustomFont(Global.BLACK, 20, 'medium'))
                                                ),
                                                Container(
                                                    padding: const EdgeInsets.only(left: 22, top: 110),
                                                    child: Global.getMenuText("pengiriman")
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  );
                                }
                                else {
                                  return Container();
                                }
                              }
                            ),

                            // Container(
                            //   padding: const EdgeInsets.only(left: 31, top: 12, right: 31),
                            //   child: Row(
                            //     children: [
                            //       Stack(
                            //         children: <Widget>[
                            //           Global.getMenuCard("jam.png", 0xffFFFFFF),
                            //           Container(
                            //               padding: const EdgeInsets.only(left: 22, top: 89),
                            //               child: Text('5', style: Global.getCustomFont(Global.BLACK, 22, 'medium'))
                            //           ),
                            //           Container(
                            //               padding: const EdgeInsets.only(left: 22, top: 120),
                            //               child: Global.getMenuText("jam perjalanan")
                            //           )
                            //         ],
                            //       ),
                            //       Container(
                            //         width: 26
                            //       ),
                            //       Stack(
                            //         children: <Widget>[
                            //           Global.getMenuCard("faktur.png", 0xffFFFFFF),
                            //           Container(
                            //               padding: const EdgeInsets.only(left: 22, top: 89),
                            //               child: Text('3', style: Global.getCustomFont(Global.BLACK, 22, 'medium'))
                            //           ),
                            //           Container(
                            //               padding: const EdgeInsets.only(left: 22, top: 120),
                            //               child: Global.getMenuText("faktur")
                            //           )
                            //         ],
                            //       ),
                            //     ],
                            //   )
                            // ),
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
                                        BlocProvider.of<PengirimanFakturBloc>(context).add(GetRekapEvent(state.getUser.id.toString(), defaultValue!));
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
            );
          }
          if(state is FailedUserState || state is NotLoggedInState) {
            return Login();
          } else {
            return Container();
          }
        })
      );

  }
}