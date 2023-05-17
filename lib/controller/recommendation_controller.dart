import 'package:get/get.dart';
import 'package:news_app_flutter_class/model/remmendationmodel.dart';

class RecommendationController extends GetxController {
  final _recommendations = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {}
}

enum Status { loading, success, error }
