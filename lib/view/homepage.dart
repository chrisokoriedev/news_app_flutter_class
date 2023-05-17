import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_class/model/remmendationmodel.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../controller/hot_news_controller.dart';

class HomePage extends StatelessWidget {
  final HotNewsController controller = Get.put(HotNewsController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hot News'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.data.value.articles!.isEmpty) {
                  return const Center(
                    child: Text('No articles available'),
                  );
                } else {
                  return SizedBox(
                    width: double.infinity,
                    height: 350,
                    child: CardSwiper(
                      cardsCount: controller.data.value.articles!.length,
                      cardBuilder: (context, index) {
                        Article article =
                            controller.data.value.articles![index];
                        return Container(
                            alignment: Alignment.bottomLeft,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(20),
                            //   image: DecorationImage(
                            //       image: CachedNetworkImageProvider(
                            //           article.urlToImage ?? ''),
                            //       fit: BoxFit.cover),
                            // ),
                            child: Stack(
                              children: [
                                Container(
                                  child: CachedNetworkImage(
                                    imageUrl: article.urlToImage ?? '',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                                Colors.red,
                                                BlendMode.colorBurn)),
                                      ),
                                    ),
                                    placeholder: (context, url) => Image.asset(
                                        'assets/images/getStarted.jpg'),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                            'assets/images/getStarted.jpg'),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.source!.name ?? '',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Gap(10),
                                      Text(
                                        article.title ?? '',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Gap(10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            timeago.format(
                                                article?.publishedAt ??
                                                    DateTime.now()),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(30)
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      },
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
