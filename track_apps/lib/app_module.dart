import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:track_apps/bloc/branch/branch_bloc.dart';
import 'package:track_apps/bloc/login/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_source/network/branch_service.dart';
import 'data_source/network/login_service.dart';

import 'data_source/repository/branch_repository.dart';
import 'data_source/repository/login_repository.dart';

class AppModule {

  final String? base_url;

  AppModule(this.base_url);

  static final GetIt injector = GetIt.instance;

  Future<void> configureOthers() async {
    final dio = Dio();
    injector.registerSingleton(dio);
    injector.registerSingleton(await SharedPreferences.getInstance());
  }

  void configureService() {
    injector.registerSingleton<LoginService>(
        LoginService.create(injector.get())
    );
    injector.registerSingleton<BranchService>(
        BranchService.create(injector.get())
    );
  }

  void configureRepository() {
    injector.registerSingleton(BranchRepository(injector.get()));
    injector.registerSingleton(LoginRepository(injector.get()));
  }

  Widget configureBloc(Widget app) {
    return MultiBlocProvider(providers: [
      BlocProvider<BranchBloc>(
        create: (_) => BranchBloc.create(injector.get()),
      ),
      BlocProvider<LoginBloc>(
        create: (_) => LoginBloc.create(injector.get()),
      ),
    ], child: app);
  }

  Future<void> setup() async {
    await configureOthers();
    configureService();
    configureRepository();
  }

}