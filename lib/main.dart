import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ictnotes/screens/Home_ict.dart';
import 'package:ictnotes/module_one_items/module_one.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:no_internet_check/internet_connectivity/navigation_Service.dart';
import 'package:native_notify/native_notify.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  NativeNotify.initialize(1580, 'FDSbeiG4aD8952UFDhu35m', null, null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigationKey,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: HomeIct(),
      ),
    );
  }
}

class MyModule extends StatelessWidget {
  const MyModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ModuleOne(),
    );
  }
}
