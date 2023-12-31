import 'package:flutter/material.dart';
import 'package:market_rack/app_config.dart';
import 'package:market_rack/features/screen/home_screen.dart';
import 'package:market_rack/features/screen/login.dart';
import 'package:market_rack/features/screen/verify.dart';
import 'package:provider/provider.dart';

import 'bloc/shared_data_bloc.dart';

mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return ChangeNotifierProvider(
      create: (_) => SharedDataBloc(),
      child: MaterialApp(
        routes: {
          '/home': (context) => const HomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/verify': (context) => const VerifyScreen(),
        },
        title: config?.appName ?? "Location Tracker",
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
