import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:track_apps/bloc/pengiriman_faktur/pengiriman_faktur_bloc.dart';
import 'package:track_apps/view/list_pengiriman/detail_pengiriman.dart';
import '../../utils/global.dart';
import '../../utils/global_state.dart';

class ListFaktur extends StatefulWidget{
  String idPengiriman;
  int resMessage;
  BackListPengiriman? backListPengiriman;
  BackListPengirimanHistory? backListPengirimanHistory;

  ListFaktur(this.idPengiriman, this.resMessage, {this.backListPengiriman, this.backListPengirimanHistory});

  @override
  State<StatefulWidget> createState() {
    return _ListFaktur();
  }
}

final GlobalState store = GlobalState.instance;
typedef BackListPengiriman = void Function(int resultMessage, BuildContext context);
typedef BackListPengirimanHistory = void Function(int resultMessage, BuildContext context);

class _ListFaktur extends State<ListFaktur> {
  String id_pengiriman = store.get("id_pengiriman");

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PengirimanFakturBloc>(context).add(GetPengirimanFakturEvent(widget.idPengiriman));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: BlocBuilder<PengirimanFakturBloc, PengirimanFakturBlocState>(
        builder: (context, state) {
          if(state is LoadingPengirimanFakturState || state is InitialPengirimanFakturBlocState) {
            return Container(
              color: Colors.white,
              child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1BA3AC)),
                  )
              ),
            );
          }
          if(state is getPengirimanFakturState) {
            return Scaffold(
                backgroundColor: const Color(0xffF7F7F7),
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  centerTitle: false,
                  leading: IconButton(
                      onPressed: () {
                        if(widget.resMessage == 1) {
                          return widget.backListPengiriman!(1, context);
                        } else {
                          return widget.backListPengirimanHistory!(2, context);
                        }
                      },
                      icon: ImageIcon(
                        const AssetImage('assets/icons/back.png'),
                        color: Color(Global.TOSCA),
                        size: 18,
                      )
                  ),
                  title: Text(
                      "Daftar Faktur",
                      style: Global.getCustomFont(Global.TOSCA, 18, 'bold')
                  ),
                ),
                body: SingleChildScrollView(
                  reverse: false,
                  child: Container(
                      padding: const EdgeInsets.only(top: 10, left: 14, right: 14, bottom: 20),
                      width: double.infinity,
                      child: Column(
                        children: [
                           ListView.builder(
                              itemCount: state.getPengirimanFaktur.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailFaktur(
                                            widget.idPengiriman,
                                            state.getPengirimanFaktur[i].no_faktur,
                                            backDaftarFaktur: (int resMessage, BuildContext ctx, String id) {
                                              if (resMessage == 1) {
                                                Navigator.of(ctx).pop();
                                                BlocProvider.of<PengirimanFakturBloc>(ctx).add(GetPengirimanFakturEvent(id));
                                              }
                                            },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Global.getCardFaktur(
                                      state.getPengirimanFaktur[i].no_faktur,
                                      state.getPengirimanFaktur[i].cust_id,
                                      state.getPengirimanFaktur[i].cust_name,
                                      state.getPengirimanFaktur[i].address
                                  ),
                                );
                              }
                          ),
                        ],
                      )
                  ),
                )
            );
          }
          else {
            return Container();
          }
        },
      )
    );
  }
}