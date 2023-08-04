
import 'package:flutter/material.dart';
import 'package:market_rack/app_config.dart';

mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
 }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var config = AppConfig.of(context);
    return MaterialApp(
      title: config?.appName ?? "Location Tracker",
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',

    );
  }
}



