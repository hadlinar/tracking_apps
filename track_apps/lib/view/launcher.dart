import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_apps/view/home.dart';
import 'package:track_apps/view/login.dart';

import '../bloc/launcher/launcher_bloc.dart';

class Launcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Launcher();
  }
}

class _Launcher extends State<Launcher> {
  @override
  void initState(){
    super.initState();
    BlocProvider.of<LauncherBloc>(context).add(LaunchAppEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<LauncherBloc, LauncherBlocState>(
          listener: (context, state) {
            if(state is LoggedInState) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Home()
              ));
            }
            if(state is NotLoggedinState) {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Login()
              ));
            }
          },
          child: Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1BA3AC)),
              )
            ),
          ),
        )
    );
  }
}