import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_class/main.dart';
import 'package:news_app_flutter_class/utils/contants.dart';
import 'package:news_app_flutter_class/view/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool getStartedIsPressed=false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              height: Get.mediaQuery.size.height * 0.7 - 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage('${imageUrl}getStarted.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            //mitch koto
            //the flutter way
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Gap(10),
                  const Text(
                    'News from around the world for you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                        height: 1.4,
                        wordSpacing: 1.3),
                  ),
                  const Gap(10),
                  const Text(
                    'Best time to read , take your time to read a  little more of this world',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const Gap(10),
                  ElevatedButton(
                      onPressed: ()  {

                        boxHive.put('done', true);
                        Get.to( HomePage());

                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          fixedSize: MaterialStateProperty.all(
                              Size(Get.mediaQuery.size.width * 0.7, 55)),
                          backgroundColor: MaterialStateProperty.all(kPrimary)),
                      child: Text('Get Started')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
