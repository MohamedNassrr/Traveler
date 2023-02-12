import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:traveler/bloc_observer.dart';
import 'package:traveler/firebase_options.dart';
import 'package:traveler/layout/traveler_cubit/traveler_layout.dart';
import 'package:traveler/modules/login_module/login_screen.dart';
import 'package:traveler/shared/components/constants.dart';
import 'package:traveler/shared/network/local/cache_helper.dart';
import 'package:traveler/shared/style/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(
        () async {
      await CacheHelper.init();

      Widget widget;
      uId = CacheHelper.getData(key: 'uId');

      if (uId != null) {
        widget = TravelerScreen();
      } else {
        widget = LoginScreen();
      }
      runApp(MyApp(
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}


class MyApp extends StatelessWidget {

  final Widget? startWidget;

  MyApp({
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: startWidget,
    );
  }
}
