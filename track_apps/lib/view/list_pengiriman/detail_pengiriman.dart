import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../bloc/pengiriman_faktur/pengiriman_faktur_bloc.dart';
import '../../utils/global.dart';
import '../../utils/global_state.dart';

class DetailFaktur extends StatefulWidget{
  String idPengiriman;
  String noFaktur;
  BackDaftarFaktur? backDaftarFaktur;
  SuccessUpdateFinishTime? updateFinishTime;

  DetailFaktur(this.idPengiriman, this.noFaktur, {this.backDaftarFaktur, this.updateFinishTime});

  @override
  State<StatefulWidget> createState() {
    return _DetailFaktur();
  }
}

final GlobalState store = GlobalState.instance;

typedef BackDaftarFaktur = void Function(int resultMessage, BuildContext context, String id);
typedef SuccessUpdateFinishTime = void Function(int resultMessage, BuildContext context);

class _DetailFaktur extends State<DetailFaktur> {
  String? valPengiriman;
  String? descPengiriman;
  String id_pengiriman = store.get("id_pengiriman");

  late String salesName = "";
  late String tanggal = "";
  late String kodePelanggan = "";
  late String namaPelanggan = "";
  late String alamat = "";
  late String namaLoper = "";
  late int check_loper = 0;
  late DateTime tanggalSelesai = DateTime.now();
  late String status = "";

  late DateTime finishTime;
  late int checkFaktur;
  late String desc;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PengirimanFakturBloc>(context).add(GetDetailFakturEvent(widget.idPengiriman, store.get("id"), widget.noFaktur));
  }

  List<Map<String, String>> statusPengiriman = [
    {
      "val": "2",
      "desc": "Barang diterima"
    },
    {
      "val": "3",
      "desc": "Barang diterima sebagian"
    },
    {
      "val": "4",
      "desc": "Pengiriman parsial"
    },
    {
      "val": "5",
      "desc": "Toko tutup"
    },
    {
      "val": "6",
      "desc": "Barang tidak sesuai"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: BlocListener<PengirimanFakturBloc, PengirimanFakturBlocState>(
        listener: (context, state) {
          if(state is LoadingPengirimanFakturState || state is InitialPengirimanFakturBlocState) {
            Container(
              color: Colors.white,
              child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1BA3AC)),
                  )
              ),
            );
          } if(state is SuccessUpdateFinishTimeState) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Global.defaultModal(() {
                    Navigator.pop(context);
                    BlocProvider.of<PengirimanFakturBloc>(context).add(GetDetailFakturEvent(widget.idPengiriman, store.get("id"), widget.noFaktur));
                  }, context, Global.CHECK_ICON, "Pengiriman dengan nomor faktur ${widget.noFaktur} selesai", "Ok", false);
                }
            );
          }
          if(state is GetDetailFakturState) {
            setState(() {
              salesName = state.getDetailFaktur[0].sales_name;
              tanggal = DateFormat('dd-MM-yyyy').format(state.getDetailFaktur[0].invoice_date!);
              kodePelanggan = state.getDetailFaktur[0].cust_id;
              namaPelanggan = state.getDetailFaktur[0].cust_name;
              alamat = state.getDetailFaktur[0].addr;
              namaLoper = state.getDetailFaktur[0].loper_name;
              check_loper = state.getDetailFaktur[0].check_faktur;
              if(check_loper != 1) {
                tanggalSelesai = state.getDetailFaktur[0].finish_faktur!;
                status = state.getDetailFaktur[0].deskripsi!;
              }
            });
          }
          else {
            Container(
              color: Colors.white,
            );
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xffF7F7F7),
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            leading: IconButton(
                onPressed: () {
                  return widget.backDaftarFaktur!(1, context, widget.idPengiriman);
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
          body: Column(
            children: [
              Container(
                  color: Color(0xffF0F4FA),
                  height: 35,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('ID Pengiriman: ' + id_pengiriman, style: Global.getCustomFont(Global.DARK_GREY, 15, 'bold')),
                  )
              ),
              Container(
                padding: const EdgeInsets.only(top: 17, left: 24, right: 24),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.noFaktur, style: Global.getCustomFont(Global.BLACK, 15, 'bold'))
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 14, left: 23, right: 10),
                  child: const Divider(
                    height: 2,
                    thickness: 0.8,
                    endIndent: 15,
                    color: Color(0xff878787),
                  )
              ),
              Container(
                  padding: const EdgeInsets.only(top: 14, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nama sales', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
                      Text(salesName, style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
                    ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tanggal Faktur', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
                      Text(tanggal, style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
                    ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Kode Pelanggan', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
                      Text(kodePelanggan, style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
                    ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, left: 24, right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Nama Pelanggan', style: Global.getCustomFont(Global.GREY, 15, 'medium'))
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          namaPelanggan,
                          style: Global.getCustomFont(Global.BLACK, 15, 'medium'),
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, left: 24, right: 24, bottom: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Alamat', style: Global.getCustomFont(Global.GREY, 15, 'medium'))
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          alamat,
                          style: Global.getCustomFont(Global.BLACK, 15, 'medium'),
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  )
              ),
              Container(
                color: Color(0xffF0F4FA),
                height: 14,
                width: double.infinity,
              ),
              Container(
                padding: const EdgeInsets.only(top: 17, left: 24, right: 24),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Info Pengiriman', style: Global.getCustomFont(Global.BLACK, 15, 'bold'))
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 14, left: 23, right: 10),
                  child: const Divider(
                    height: 2,
                    thickness: 0.8,
                    endIndent: 15,
                    color: Color(0xff878787),
                  )
              ),
              Container(
                  padding: const EdgeInsets.only(top: 14, left: 24, right: 24, bottom: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nama Loper', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
                      Text(namaLoper, style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
                    ],
                  )
              ),
              Container(
                color: const Color(0xffF0F4FA),
                height: 14,
                width: double.infinity,
              ),
              Container(
                padding: const EdgeInsets.only(top: 14, left: 24, right: 14, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Status', style: Global.getCustomFont(Global.BLACK, 15, 'bold'))
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.only(top: 3, bottom: 3, left: 9, right: 9),
                      child: Text(check_loper == 1 ? "Sedang dalam pengiriman" : "Selesai", style: Global.getCustomFont(Global.WHITE, 14, 'bold')),
                      decoration: BoxDecoration(
                          color: check_loper == 1 ? Color(0xffFCD713) : Color(0xff04D90D),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),
              ),
              check_loper != 1 ? Container(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Waktu', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
                      Text(DateFormat("dd MMM yyyy").format(tanggalSelesai).toString() + ", " + DateFormat.Hm().format(tanggalSelesai).toString())
                    ],
                  )
              ): Container(),
              check_loper != 1 ?Container(
                  padding: const EdgeInsets.only(top: 5, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Catatan', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
                      Text(status, style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
                    ],
                  )
              ) : Container(),
              check_loper != 1 ? Container() : Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 18, right: 18, top: 9, bottom: 9),
                      margin: const EdgeInsets.only(bottom: 20),
                      width: double.infinity,
                      height: 56,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(Global.TOSCA)),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          color: Color(Global.TOSCA),
                          onPressed: () {
                            showDialog(
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)
                                        )
                                    ),
                                    content: SizedBox(
                                      width: 322,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                              padding: const EdgeInsets.only(bottom: 21),
                                              child: DropdownButtonFormField<String>(
                                                isExpanded: true,
                                                hint: const Text("Status pengiriman"),
                                                dropdownColor: Colors.white,
                                                style: Global.getCustomFont(Global.BLACK, 15, 'medium'),
                                                value: valPengiriman,
                                                items: statusPengiriman.map((e) {
                                                  return DropdownMenuItem<String>(
                                                    value: e['val']! + ', ' + e['desc']!,
                                                    child: Text(e['desc']!),
                                                  );
                                                }).toList(),
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    valPengiriman = value;
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 12),
                                                  labelText: "Status pengiriman",
                                                  labelStyle: const TextStyle(
                                                      color: Color(0xff757575),
                                                      fontSize: 15,
                                                      fontFamily: 'medium'),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                      borderSide: const BorderSide()
                                                  ),
                                                ),
                                              )
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Expanded(
                                                  flex: 1,
                                                  child: RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                          side: BorderSide(
                                                              color: Color(Global.RED),
                                                              width: 3)),
                                                      color: Colors.white,
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text(
                                                        "Batal",
                                                        style: TextStyle(
                                                            color: Color(Global.RED),
                                                            fontFamily: 'bold',
                                                            fontSize: 14
                                                        ),
                                                      )
                                                  )
                                              ),
                                              Container(
                                                  width: 20
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                          side: BorderSide(color: Color(Global.TOSCA)),
                                                          borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      color: Color(Global.TOSCA),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                        String time = DateTime.now().toString();
                                                        BlocProvider.of<PengirimanFakturBloc>(context).add(
                                                            UpdateFinishTimeEvent(
                                                                widget.idPengiriman,
                                                                widget.noFaktur,
                                                                time,
                                                                int.parse(valPengiriman!.split(", ")[0]),
                                                                valPengiriman!.split(", ")[1]                                                            )
                                                        );
                                                      },
                                                      child: Text(
                                                        "Simpan",
                                                        style: Global.getCustomFont(Global.WHITE, 14, 'bold'),
                                                      ))),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                context: context
                            );
                          },
                          child: const Text(
                            "Selesai pengiriman ke outlet",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'bold',
                                fontSize: 15
                            ),
                          )
                      ),
                    ),
                  ]
              ),
            ],
          ),

        ),
      )
    );
  }
}