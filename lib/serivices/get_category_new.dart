import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/remmendationmodel.dart';
class GetNewCategoryServices extends GetxController {
  final Dio _dio = Dio();
  final String apiKey = 'ec54dfe0089f42608e846db8f2655a7e';

  Future<NewModel> getCategoryNewsApiS(String dataParam) async {
    try {
      var apiConnect = await _dio.get(
          'https://newsapi.org/v2/everything?q=$dataParam&apiKey=ec54dfe0089f42608e846db8f2655a7e'
              .trim());
      if (apiConnect.statusCode == 200) {
        var data = apiConnect.data;
        var jsonString = json.encode(data); // Convert data to a JSON string
        final newModel = newModelFromJson(jsonString); // Parse the JSON string
        print(newModel!.articles);
        return newModel;
      } else {
        print('Request failed');
      }
    } catch (e) {
      print(e);
    }
    return NewModel(
        status: '',
        totalResults: null,
        articles: []); // Return an empty NewModel if there's an error
  }
}
