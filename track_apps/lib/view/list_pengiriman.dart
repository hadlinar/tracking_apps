import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_apps/bloc/tracking_loper/tracking_loper_bloc.dart';
import 'package:intl/intl.dart';
import '../utils/global.dart';
import '../utils/global_state.dart';
import 'list_pengiriman/daftar_faktur.dart';

class ListPengiriman extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _ListPengiriman();
  }
}

final GlobalState store = GlobalState.instance;

class _ListPengiriman extends State<ListPengiriman> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TrackingLoperBloc>(context).add(GetTrackingLoperEvent(store.get("id")));
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
          if(state is GetTrackingLoperState){
            return Scaffold(
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
                    padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    width: double.infinity,
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: state.getTrackingLoper.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ListFaktur(
                                          state.getTrackingLoper[i].id.toString(), 1,
                                          backListPengiriman: (int resMessage, BuildContext ctx) {
                                            if (resMessage == 1) {
                                              Navigator.of(ctx).pop();
                                              BlocProvider.of<TrackingLoperBloc>(context).add(GetTrackingLoperEvent(store.get("id")));
                                            }
                                          },
                                        ),
                                      ),
                                    );

                                    store.set("id_pengiriman", state.getTrackingLoper[i].id_pengiriman);
                                  },
                                  child: Global.getCardPengiriman(
                                    state.getTrackingLoper[i].id_pengiriman,
                                    state.getTrackingLoper[i].start_loper == null ? 0xff6FA9F7 : (state.getTrackingLoper[i].finish_loper == null ? 0xffFCD713 : 0xff04D90D),
                                    state.getTrackingLoper[i].start_loper == null ? "Barang belum dikirim" : (state.getTrackingLoper[i].finish_loper == null ? "Sedang dalam pengiriman" : "Selesai"),
                                    DateFormat('dd MMM yyyy').format(state.getTrackingLoper[i].tanggal!.toLocal()).toString() + ", " + DateFormat.Hm().format(state.getTrackingLoper[i].tanggal!.toLocal()),
                                    state.getTrackingLoper[i].jumlah
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