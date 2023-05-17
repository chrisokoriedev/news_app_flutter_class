import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_class/model/remmendationmodel.dart';

import '../controller/hot_news_controller.dart';

class HomePage extends StatelessWidget {
  final HotNewsController controller = Get.put(HotNewsController());

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hot News'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.data.value.articles!.isEmpty) {
          return Center(
            child: Text('No articles available'),
          );
        } else {
          return ListView.builder(
            itemCount: controller.data.value.articles!.length,
            itemBuilder: (context, index) {
              Article article = controller.data.value.articles![index];
              return ListTile(
                title: Text(article.title??''),
                subtitle: Text(article.description??''),
                onTap: () {
                  // Handle article tap
                },
              );
            },
          );
        }
      }),
    );
  }
}
