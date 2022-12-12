import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:track_apps/bloc/branch/branch_bloc.dart';
import 'package:track_apps/bloc/launcher/launcher_bloc.dart';
import 'package:track_apps/bloc/login/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_apps/bloc/pengiriman_faktur/pengiriman_faktur_bloc.dart';
import 'package:track_apps/bloc/tracking_loper/tracking_loper_bloc.dart';
import 'package:track_apps/bloc/user/user_bloc.dart';
import 'package:track_apps/data_source/network/pengiriman_faktur_service.dart';
import 'package:track_apps/data_source/network/tracking_loper_service.dart';
import 'package:track_apps/data_source/network/user_service.dart';
import 'package:track_apps/data_source/repository/pengiriman_faktur_repository.dart';
import 'package:track_apps/data_source/repository/tracking_loper_repository.dart';
import 'package:track_apps/data_source/repository/user_repository.dart';

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
    injector.registerSingleton<PengirimanFakturService>(
        PengirimanFakturService.create(injector.get())
    );
    injector.registerSingleton<TrackingLoperService>(
        TrackingLoperService.create(injector.get())
    );
    injector.registerSingleton<UserService>(
        UserService.create(injector.get())
    );
  }

  void configureRepository() {
    injector.registerSingleton(BranchRepository(injector.get()));
    injector.registerSingleton(LoginRepository(injector.get()));
    injector.registerSingleton(PengirimanFakturRepository(injector.get()));
    injector.registerSingleton(TrackingLoperRepository(injector.get()));
    injector.registerSingleton(UserRepository(injector.get()));
  }

  Widget configureBloc(Widget app) {
    return MultiBlocProvider(providers: [
      BlocProvider<BranchBloc>(
        create: (_) => BranchBloc.create(injector.get()),
      ),
      BlocProvider<LoginBloc>(
        create: (_) => LoginBloc.create(injector.get()),
      ),
      BlocProvider<PengirimanFakturBloc>(
        create: (_) => PengirimanFakturBloc.create(injector.get(), injector.get()),
      ),
      BlocProvider<TrackingLoperBloc>(
        create: (_) => TrackingLoperBloc.create(injector.get(), injector.get()),
      ),
      BlocProvider<UserBloc>(
        create: (_) => UserBloc.create(injector.get(), injector.get()),
      ),
      BlocProvider<LauncherBloc>(
        create: (_) => LauncherBloc.create(injector.get()),
      ),
    ], child: app);
  }

  Future<void> setup() async {
    await configureOthers();
    configureService();
    configureRepository();
  }

}