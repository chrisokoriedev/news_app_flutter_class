import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/remmendationmodel.dart';

class RecommendationApi {
  final Dio _dio = Dio();
  final String apiKey = 'ec54dfe0089f42608e846db8f2655a7e';
  final String apiEndpoint =
      'https://newsapi.org/v2/everything?apiKey=ec54dfe0089f42608e846db8f2655a7e&q=nigeria&pageSize=10';

  Future getResult() async {
    try {
      final apiResult = await _dio.get(apiEndpoint);

      if (apiResult.statusCode == 200) {
        final dataDetail = apiResult.data;
        RecommendationModel recommendationModel =
            RecommendationModel.fromJson(dataDetail);
        return recommendationModel.articles ;
      } else if (apiResult.statusCode == 401) {
      } else {
        Get.snackbar('status', 'Something went wrong');
        return null;
      }
    } catch (e) {
      Get.snackbar('status', e.toString());
      return null;
    }
  }
}
