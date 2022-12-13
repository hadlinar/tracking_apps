import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_apps/bloc/tracking_loper/tracking_loper_bloc.dart';
import 'package:intl/intl.dart';
import '../utils/global.dart';
import '../utils/global_state.dart';
import 'list_pengiriman/daftar_faktur.dart';

class Riwayat extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _Riwayat();
  }
}

final GlobalState store = GlobalState.instance;

class _Riwayat extends State<Riwayat> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TrackingLoperBloc>(context).add(GetHistoryLoperEvent(store.get("id")));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: BlocBuilder<TrackingLoperBloc, TrackingLoperBlocState> (
            builder: (context, state) {
              print(state.toString());
              if(state is LoadingTrackingLoperState || state is InitialTrackingLoperBlocState) {
                return Container(
                  color: Colors.white,
                  child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1BA3AC)),
                      )
                  ),
                );
              }
              if(state is GetHistoryLoperState){
                return Scaffold(
                    backgroundColor: const Color(0xffF7F7F7),
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      centerTitle: false,
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: ImageIcon(
                            const AssetImage('assets/icons/back.png'),
                            color: Color(Global.TOSCA),
                            size: 18,
                          )
                      ),
                      title: Text(
                          "Riwayat Pengiriman",
                          style: Global.getCustomFont(Global.TOSCA, 18, 'bold')
                      ),
                    ),
                    body: Container(
                        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
                        width: double.infinity,
                        child: Column(
                          children: [
                            ListView.builder(
                                itemCount: state.getHistoryLoper.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return InkWell(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ListFaktur(
                                              state.getHistoryLoper[i].id.toString(), 2,
                                              backListPengirimanHistory: (int resMessage, BuildContext ctx) {
                                                if (resMessage == 2) {
                                                  Navigator.of(ctx).pop();
                                                  BlocProvider.of<TrackingLoperBloc>(context).add(GetHistoryLoperEvent(store.get("id")));
                                                }
                                              },
                                            ),
                                          ),
                                        );

                                        store.set("id_pengiriman", state.getHistoryLoper[i].id_pengiriman);
                                      },
                                      child: Global.getCardPengiriman(
                                        state.getHistoryLoper[i].id_pengiriman,
                                        state.getHistoryLoper[i].start_loper == null ? 0xff6FA9F7 : (state.getHistoryLoper[i].finish_loper == null ? 0xffFCD713 : 0xff04D90D),
                                        state.getHistoryLoper[i].start_loper == null ? "Barang belum dikirim" : (state.getHistoryLoper[i].finish_loper == null ? "Sedang dalam pengiriman" : "Selesai"),
                                        DateFormat('dd MMM yyyy').format(state.getHistoryLoper[i].tanggal!.toLocal()).toString() + ", " + DateFormat.Hm().format(state.getHistoryLoper[i].tanggal!.toLocal()),
                                        state.getHistoryLoper[i].jumlah
                                      )
                                  );
                                }
                            )
                          ],
                        )
                    )
                );
              } else {
                return Container();
              }
            }
        )
    );
  }
}