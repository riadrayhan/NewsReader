import 'dart:convert';

import 'package:http/http.dart';

import '../models/news_model.dart';

class ApiServices {
  final all_news_url =
      "https://newsapi.org/v2/everything?q=*&apiKey=b7a147696a4a4aaabd7857b1e3650a67";

  final breaking_news_url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=b7a147696a4a4aaabd7857b1e3650a67";

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articles =
            body.map((dynamic item) => NewsModel.fromJson(item)).toList();
        return articles;
      } else {
        throw ("No artile found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breaking_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articles =
            body.map((dynamic item) => NewsModel.fromJson(item)).toList();
        return articles;
      } else {
        throw ("No artile found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
