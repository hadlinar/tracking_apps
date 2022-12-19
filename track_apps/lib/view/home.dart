import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_apps/bloc/launcher/launcher_bloc.dart';
import 'package:track_apps/view/dashboard.dart';
import 'package:track_apps/view/list_pengiriman.dart';
import 'package:track_apps/view/profile.dart';
import '../bloc/pengiriman_faktur/pengiriman_faktur_bloc.dart';
import '../utils/global_state.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

final GlobalState store = GlobalState.instance;

class _Home extends State<Home> {
  String? defaultValue;
  List<String> filterStat = [
    'Harian',
    'Bulanan'
  ];

  int _currentIndex = 0;

  final List<Widget> _children = [
    Dashboard(),
    ListPengiriman(),
    Profile()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LauncherBloc, LauncherBlocState>(
      builder: (context, state) {
        print("launcher in home " + state.toString());
        if(state is InitialLauncherState || state is LoadingPengirimanFakturState) {
          return Container();
        }
        if (state is NotLoggedinState) {
          return Container();
        }
        if(state is LoggedInState) {
          return Scaffold(
            body: _children[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              backgroundColor: Color(0xffffffff),
              onTap: onTabTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/icons/beranda.png')
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/icons/list.png')
                  ),
                  label: 'Daftar Pengiriman',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/icons/profile.png')
                  ),
                  label: 'Profil',
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}