import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:machine_test_scrud_networks/Model/news_model.dart';

class RemoteNewsService {
  static var client = http.Client();

  static Future<List<NewsArticle>?> fetchNewsArticles() async {
    var apiKey = "46a000e089a944ac922b797dc5040a82";
    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=${apiKey}"));

    log("${response.body}");
    if (response.statusCode == 200) {
      return newsArticleFromJson(response.body);
    } else {
      return null;
    }
  }
}
