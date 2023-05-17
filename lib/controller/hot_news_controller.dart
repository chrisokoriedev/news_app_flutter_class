import 'package:get/get.dart';
import 'package:news_app_flutter_class/model/remmendationmodel.dart';

import '../serivices/recommdation_service.dart';

class HotNewsController extends GetxController {
  var isLoading = true.obs;
  var data = NewModel(status: '0', totalResults: 0, articles: []).obs;

  @override
  void onInit() {
    super.onInit();
    dataFetchFromServices();
  }

  void dataFetchFromServices() async {
    try {
      isLoading.value = true;
      NewModel fetchedData = await NewService().getHotNews();
      if (fetchedData.articles!.isNotEmpty) {
        data.value = fetchedData;
      } else {
        // Handle the case where no articles are available
        data.value = NewModel(status: '0', totalResults: 0, articles: []);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
