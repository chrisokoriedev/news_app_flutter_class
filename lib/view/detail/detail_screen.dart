import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DetailScreen extends StatelessWidget {
  final String? title;
  final String? imgUrl;
  final String? contentText;
  final DateTime? time;
  final String? source;

  const DetailScreen(
      {Key? key,
      required this.title,
      required this.imgUrl,
      required this.contentText,
      required this.time,
      required this.source})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.cloud_circle))
              ],
            ),
            Gap(3.h),
            Text(
              title ?? 'Failed to load',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.9,
                  height: 1.5),
            ),
            Gap(1.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.sp),
              child: CachedNetworkImage(
                imageUrl: imgUrl.toString(),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 45.h,
              ),
            ),
            Gap(1.h),
          ],
        ),
      ),
    );
  }
}
