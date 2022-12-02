import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:track_apps/view/home.dart';
// import 'package:rinjani/bloc/user/user_bloc.dart';

import '../../utils/global.dart';
import '../bloc/login/login_bloc.dart';
import '../utils/global_state.dart';
import 'dashboard.dart';

class Login extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

final GlobalState store = GlobalState.instance;

class _LoginPage extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String username = '';
  String pass = '';
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  'assets/images/login.svg',
                )
              ),
              Container(
                  padding: const EdgeInsets.only(left: 21, right: 21),
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 20),
                        child: TextFormField(
                          style: Global.getCustomFont(Global.BLACK, 15, 'medium'),
                          maxLines: 1,
                          controller: usernameController,
                          onChanged: (text) {
                            username = text;
                          },
                          decoration: InputDecoration(
                            labelText: "Username",
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius .circular(10),
                                borderSide: BorderSide()),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 32.0),
                        child: TextFormField(
                          controller: passwordController,
                          onChanged: (text) {
                            pass = text;
                          },
                          style: Global.getCustomFont(Global.BLACK, 15, 'medium'),
                          obscureText: showPassword,
                          decoration: InputDecoration(
                              labelText: "Kata sandi",
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius .circular(10),
                                  borderSide: const BorderSide()
                              ),
                              suffixIcon: IconButton(
                                  icon: const Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  }
                              )
                          ),
                        ),
                      ),
                      Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 18, right: 18, top: 9, bottom: 9),
                              width: 150,
                              height: 56,
                              color: Colors.white,
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Color(Global.TOSCA)),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  color: Color(Global.TOSCA),
                                  onPressed: () {
                                    print(username);
                                    print(pass);
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => Home()
                                    ));
                                    // BlocProvider.of<LoginBloc>(context).add(
                                    //     LoginEvent(
                                    //         username,
                                    //         pass
                                    //     )
                                    // );

                                  },
                                  child: const Text(
                                    "Login",
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
                    ] ,
                  )
              )
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}