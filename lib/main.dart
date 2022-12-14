import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ictnotes/screens/Home_ict.dart';
import 'package:ictnotes/module_one_items/module_one.dart';
import 'dart:ui';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:ictnotes/screens/Home_ict.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(),
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
