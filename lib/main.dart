import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_class/utils/contants.dart';
import 'package:news_app_flutter_class/view/getStarted.dart';
import 'package:news_app_flutter_class/view/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool checkBool=false;

  @override
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    final pref = await SharedPreferences.getInstance();
    checkBool = pref.getBool('getStartedChecker')!;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldColor,
        primarySwatch: Colors.blue,
      ),
      home: checkBool ?  const HomePage() : const GetStartedScreen(),
    );
  }
}
