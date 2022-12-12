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

  ListFaktur(this.idPengiriman);

  @override
  State<StatefulWidget> createState() {
    return _ListFaktur();
  }
}

final GlobalState store = GlobalState.instance;

class _ListFaktur extends State<ListFaktur> {

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
                body: SingleChildScrollView(
                  reverse: false,
                  child: Container(
                      padding: const EdgeInsets.only(top: 10, left: 14, right: 14, bottom: 20),
                      width: double.infinity,
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailFaktur(),
                                  ),
                                );
                              },
                              child: ListView.builder(
                                  itemCount: state.getPengirimanFaktur.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    return Global.getCardFaktur(
                                        state.getPengirimanFaktur[i].no_faktur,
                                        state.getPengirimanFaktur[i].cust_id,
                                        state.getPengirimanFaktur[i].cust_name,
                                        state.getPengirimanFaktur[i].address
                                    );
                                  }
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