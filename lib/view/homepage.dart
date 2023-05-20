import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_class/model/remmendationmodel.dart';
import 'package:news_app_flutter_class/utils/contants.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:sizer/sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../controller/hot_news_controller.dart';

class HomePage extends StatelessWidget {
  final HotNewsController controller = Get.put(HotNewsController());
  final CardSwiperController cardSwiperController = CardSwiperController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10.h),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: Shimmer(
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
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
                      isLoop: true,
                      controller: cardSwiperController,
                      cardsCount: controller.data.value.articles!.length,
                      cardBuilder: (context, index) {
                        Article article =
                            controller.data.value.articles![index];
                        return Container(
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: article.urlToImage ?? '',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => ClipRRect(
                                    borderRadius: BorderRadius.circular(20.sp),
                                    child: Image.asset(
                                      'assets/images/bg.jpeg',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.maxFinite,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/bg.jpeg',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.maxFinite,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.source!.name ?? '',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Gap(1.h),
                                      Text(
                                        article.title ?? '',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Gap(1.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            timeago.format(
                                                article.publishedAt ??
                                                    DateTime.now()),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 9.sp,
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
              Gap(5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildInkWell('Policies', () {}),
                      buildInkWell('Policies', () {}),
                      buildInkWell('Policies', () {}),
                    ],
                  ),
                  Gap(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildInkWell('Policies', () {}),
                      buildInkWell('Policies', () {}),
                      buildInkWell('Policies', () {}),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildInkWell(String title, VoidCallback press) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(8.sp),
      child: Container(
        width: 28.w,
        height: 9.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            color: kPrimary.withOpacity(0.3),
            border: Border.all(
              color: kPrimary,
            )),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: Colors.black38),
        ),
      ),
    );
  }
}
