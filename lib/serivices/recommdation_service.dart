import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/remmendationmodel.dart';

class RecommendationApi {
  final Dio _dio = Dio();
  final String apiKey = 'ec54dfe0089f42608e846db8f2655a7e';
  final String apiEndpoint =
      'https://newsapi.org/v2/top-headlines?country=ng&apiKey=\$apiKey&pageSize=10';

  Future<List<Article>?> getResult() async {

      final apiResult = await _dio.get(apiEndpoint);

      if (apiResult.statusCode == 200) {
        final dataDetail = apiResult.data;
        final recommendationModel = RecommendationModel.fromJson(dataDetail);
        print(recommendationModel.articles);
        return recommendationModel.articles;
      } else {
        Get.snackbar('status', 'Something went wrong');
        return null;
      }
    // } catch (e) {
    //   Get.snackbar('status', e.toString());
    //   return null;
    // }
  }
}