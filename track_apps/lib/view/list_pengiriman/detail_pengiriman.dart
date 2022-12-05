import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/global.dart';
import '../../utils/global_state.dart';

class DetailFaktur extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _DetailFaktur();
  }
}

final GlobalState store = GlobalState.instance;

class _DetailFaktur extends State<DetailFaktur> {
  List<CustomerCategory> custCat = [

  ];

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
                    child: Text('ID Pengiriman: ' + 'TRK-2022-KP-0001', style: Global.getCustomFont(Global.DARK_GREY, 15, 'bold')),
                  )
              ),
              Container(
                padding: const EdgeInsets.only(top: 17, left: 24, right: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                    child: Text('FKT/BDG/2022/00000130', style: Global.getCustomFont(Global.BLACK, 15, 'bold'))
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
                    Text('John Doe', style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
                  ],
                )
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tanggal Faktur', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
                      Text('25-11-2022', style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
                    ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Kode Pelanggan', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
                      Text('30055011', style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
                    ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nama Pelanggan', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
                      Text('MUSTAJAB 2, TO', style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
                    ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.only(top: 5, left: 24, right: 24, bottom: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Alamat', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
                      Text('JL.T.HASAN DEK,GP.LAMSEUPENG', style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
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
                      Text('Aufar Rafdi', style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
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
                    //TODO
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.only(top: 3, bottom: 3, left: 9, right: 9),
                      child: Text("Barang belum dikirim", style: Global.getCustomFont(Global.WHITE, 14, 'bold')),
                      decoration: BoxDecoration(
                        //TODO
                          color: Color(0xff6FA9F7),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),
              ),



              //TODO: kalau barang sudah diterima
              // Container(
              //     padding: const EdgeInsets.only(top: 5, left: 24, right: 24),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text('Waktu', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
              //         Text('16 Nov 2022, 13:57', style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
              //       ],
              //     )
              // ),
              // Container(
              //     padding: const EdgeInsets.only(top: 5, left: 24, right: 24),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text('Catatan', style: Global.getCustomFont(Global.GREY, 15, 'medium')),
              //         Text('Barang diterima', style: Global.getCustomFont(Global.BLACK, 15, 'medium'))
              //       ],
              //     )
              // ),
            ],
          ),
          bottomNavigationBar: Stack(
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
                      AlertDialog(
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
                                    value: cusCat,
                                    items: custCat.map((e) {
                                      return DropdownMenuItem<String>(
                                        value: e.category_id,
                                        child: Text(e.category_name),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        cusCat = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 12, right: 12),
                                      labelText: "Category",
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
                                                  color: Theme
                                                      .of(context)
                                                      .accentColor,
                                                  width: 3
                                              )
                                          ),
                                          color: Colors.white,
                                          onPressed: () {
                                            newCustomerController.text = "";
                                            cusCat = null;
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: Color(Global.BLUE),
                                                fontFamily: 'bold',
                                                fontSize: 15
                                            ),
                                          )
                                      )
                                  ),
                                  Container(
                                    width: 25,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              side:
                                              BorderSide(color: Color(Global.BLUE)),
                                              borderRadius: BorderRadius.circular(10)),
                                          color: Color(Global.BLUE),
                                          onPressed: () {
                                            setState(() {
                                              savedCust = true;
                                            });
                                            if(newCustomerController.text == "") {
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return Global.defaultModal(() {
                                                      Navigator.pop(context);
                                                    }, context, Global.WARNING_ICON, "Please add new customer's name", "Ok", false);
                                                  }
                                              );
                                            }
                                            else if (cusCat == null) {
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return Global.defaultModal(() {
                                                      Navigator.pop(context);
                                                    }, context, Global.WARNING_ICON, "Please add new customer's category", "Ok", false);
                                                  }
                                              );
                                            } else {
                                              store.set("cust_id", "null");
                                              store.set("cust_name", newCustomerController.text );
                                              store.set("cat_id", cusCat);
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text("Add", style: Global.getCustomFont(Global.WHITE, 14, 'bold'))
                                      )
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
      ),
    );
  }
}