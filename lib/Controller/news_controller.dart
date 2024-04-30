import 'dart:developer';

import 'package:get/get.dart';
import 'package:machine_test_scrud_networks/Model/news_model.dart';
import 'package:machine_test_scrud_networks/Services/remote_service.dart';

class NewsController extends GetxController {
  var newsArticles = <NewsArticle>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var articles = await RemoteNewsService.fetchNewsArticles();
      log("${articles}");
      if (articles != null) {
        newsArticles(articles);
      }
    } finally {
      isLoading(false);
    }
  }
}
