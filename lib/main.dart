import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:news_app_flutter_class/controller/hot_news_controller.dart';
import 'package:news_app_flutter_class/utils/contants.dart';
import 'package:news_app_flutter_class/view/maincontroll.dart';
import 'package:news_app_flutter_class/view/onboarding/getStarted.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:sizer/sizer.dart';

var boxHive;

Future<void> main() async {
  final HotNewsController controller = Get.put(HotNewsController());
  controller.onStart;
  controller.onInit();

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
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: kScaffoldColor,
            colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
            useMaterial3: true,
          ),
          home: boxHive.get('done') == true
              ? const MainControlScreen()
              : const GetStartedScreen(),
        );
      },
    );
  }
}
