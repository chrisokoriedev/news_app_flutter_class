import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:news_app_flutter_class/utils/contants.dart';
import 'package:news_app_flutter_class/view/getStarted.dart';
import 'package:news_app_flutter_class/view/maincontroll.dart';
import 'package:path_provider/path_provider.dart' as path;

var boxHive;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await path.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox('myBox');
  boxHive = Hive.box('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldColor,
        primarySwatch: Colors.blue,
      ),
      home: boxHive.get('done') == true
          ? const MainConrolScreen()
          : const GetStartedScreen(),
    );
  }
}
