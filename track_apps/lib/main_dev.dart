import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:track_apps/resources/app_config.dart';
import 'package:track_apps/toba_apps.dart';
import 'app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DotEnv().load('.env-app');
  final url = DotEnv().env['BASE_URL_PROD'];
  final appModule = AppModule(url);
  await appModule.setup();
  final rootApp = appModule.configureBloc(TrackingApp());

  final app =
  AppConfig(urlEndpoint: url, buildFlavor: "development", child: rootApp);
  runApp(app);
}