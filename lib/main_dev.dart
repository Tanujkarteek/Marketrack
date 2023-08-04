import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:market_rack/app_config.dart';
import 'package:market_rack/main_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // use this to provide env data
  //flutter build appbundle --obfuscate -t lib/main_dev.dart --flavor dev --dart-define=ENV_URL=<enter url>
  //flutter build apk --obfuscate -t lib/main_dev.dart --flavor dev --dart-define=ENV_URL=<enter url>
  await dotenv.load(fileName: ".env.dev");
  await mainCommon();

  var configuredApp = const AppConfig(appName: "dev", child: MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(
      const MyApp(),
    );
  });
}
