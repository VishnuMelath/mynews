import 'dart:convert';

import 'package:mynews/models/news_model.dart';
import 'package:http/http.dart' as http;

import '../utils/api_data.dart';
class NewsApiServices {
  Future<List<NewsDataModel>> getAllNews(String countryCode) async
  {
    List<NewsDataModel> news=[];
    try {
      var responce = await http.get(Uri.parse(ApiCredential().getUrl(countryCode)));
      if (responce.statusCode == 200) {
        List data = jsonDecode(responce.body)['articles'];
        for (var element in data) {
          news.add(NewsDataModel.fromJson(element));
        }
      }
      else 
      {
        throw Exception('Something went wrong!Please try again');
      }
      return news;
    } catch (e) {
      rethrow;
    }

  }
}