import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:track_apps/bloc/loper/loper_bloc.dart';
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
  void initState() {
    super.initState();
    BlocProvider.of<LoperBloc>(context).add(GetLoperEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoperBloc, LoperBlocState>(
      builder: (context, state) {
        print(state.toString());
        if(state is GetLoperState) {
          return Scaffold(
              backgroundColor: const Color(0xffF7F7F7),
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
              ),
              body: Stack(
                children: [
                  Container(

                      margin: const EdgeInsets.only(top: 102),
                      padding: const EdgeInsets.only(top: 183, left: 39),
                      height: 230,
                      decoration: const BoxDecoration(
                          color: Color(0xff1CBAC5),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                          )
                      ),
                      child: InkWell(
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Global.defaultModal(() {
                                  Navigator.pop(context);
                                  store.set("id", "");
                                  BlocProvider.of<LoperBloc>(context).add(LogoutEvent());
                                }, context, Global.WARNING_ICON, "Anda akan keluar akun", "Keluar", true);
                              }
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Image.asset(
                                    'assets/icons/logout.png'
                                )
                            ),
                            Container(
                              width: 11,
                            ),
                            Container(
                                padding: const EdgeInsets.only(top: 3, left: 12),
                                child: Text('Keluar', style: Global.getCustomFont(Global.WHITE, 18, 'bold'))
                            )
                          ],
                        )
                      )

                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 102),
                    padding: const EdgeInsets.only(top: 117, left: 39),
                    height: 167,
                      decoration: const BoxDecoration(
                          color: const Color(0xff1BA3AC),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                          )
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/icons/riwayat.png'
                          )
                        ),
                        Container(
                          width: 11,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 3, left: 12),
                          child: Text('Riwayat', style: Global.getCustomFont(Global.WHITE, 18, 'bold'))
                        )
                      ],
                    )
                  ),
                  Container(
                      height: 200,
                      decoration: const BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                          )
                      ),
                      child: Stack (
                        children: [
                          Container(
                             padding: const EdgeInsets.only(top: 6),
                             child:  Align(
                                 alignment: Alignment.center,
                                 child: Text(state.getLoper.nama_loper, style: Global.getCustomFont(Global.BLACK, 22, 'bold')),
                             )
                          ),
                          Container(
                              padding: const EdgeInsets.only(top: 72),
                              child:  Align(
                                alignment: Alignment.center,
                                child: Text(state.getLoper.branch, style: Global.getCustomFont(Global.BLACK, 18, 'medium')),
                              )
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 132),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height:10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: state.getLoper.status_kerja == 1 ? const Color(0xffFCD713) : Color(Global.GREEN),
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                ),
                                Container(
                                  width: 11,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(state.getLoper.status_kerja == 1 ? 'Aktif' : 'Available', style: Global.getCustomFont(Global.BLACK, 15, 'medium')),
                                ),
                              ],
                            )
                          )
                        ],
                      )
                    ),
                ],
              )
          );
        }
        if(state is FailedLoperState) {
          return Login();
        } else {
          return Container();
        }
      }
    );

  }
}