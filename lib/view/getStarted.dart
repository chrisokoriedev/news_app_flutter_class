import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_class/utils/contants.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10
            ),
            width: double.infinity,
            height: Get.mediaQuery.size.height * 0.7,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              image: DecorationImage(
                  image: AssetImage('${imageUrl}getStarted.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
