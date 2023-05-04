import 'package:get/get.dart';
import 'package:news_app_flutter_class/model/remmendationmodel.dart';
import 'package:news_app_flutter_class/serivices/recommdation_service.dart';

class RecommendationController extends GetxController {
  var isLoading = true.obs;
  var articles = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      final result = await RecommendationApi().getResult();
      if (result is List<Article>) {
        articles.assignAll(result);
      } else {
        Get.snackbar('Error', 'Invalid response format');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
