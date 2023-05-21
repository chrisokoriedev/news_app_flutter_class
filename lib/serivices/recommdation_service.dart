import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/remmendationmodel.dart';

class NewService extends GetxController {
  final Dio _dio = Dio();
  final String apiKey = 'ec54dfe0089f42608e846db8f2655a7e';
  final String apiEndpoint =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=ec54dfe0089f42608e846db8f2655a7e'
          .trim();

  Future<NewModel> getHotNews() async {
    try {
      var apiConnect = await _dio.get(apiEndpoint);
      if (apiConnect.statusCode == 200) {
        var data = apiConnect.data;
        var jsonString = json.encode(data); // Convert data to a JSON string
        final newModel = newModelFromJson(jsonString); // Parse the JSON string
        return newModel!;
      } else {
        print('Request failed');
      }
    } catch (e) {
      print('hey');
      Get.snackbar('status', e.toString());
    }
    return NewModel(status: '', totalResults: null, articles: []);
  }
}

