import 'dart:convert';
import 'package:clean_architecture_news_app/core/constants/constants.dart';
import 'package:clean_architecture_news_app/core/error/exception.dart';
import 'package:clean_architecture_news_app/features/news/data/models/articles_model.dart';
import 'package:http/http.dart' as http;

abstract class ArticleRemoteDataSource {
  Future<List<ArticleModel>> getNewsHeadlines(String channelName);
  Future<List<ArticleModel>> getCategoriesNews(String category);
}

class ArticlesRemoteDataSourceImplementation extends ArticleRemoteDataSource {
  final http.Client client;

  ArticlesRemoteDataSourceImplementation({required this.client});

  @override
  Future<List<ArticleModel>> getNewsHeadlines(String channelName) async {
    final response = await client
        .get(Uri.parse(Urls.getNewsHeadlinesByChannelName(channelName)));

    if (response.statusCode == 200) {
      final List<dynamic> articlesJson = json.decode(response.body)['articles'];
      return articlesJson.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ArticleModel>> getCategoriesNews(String category) async {
    final response =
        await client.get(Uri.parse(Urls.getCategoryNews(category)));

    if (response.statusCode == 200) {
      final List<dynamic> articlesJson = json.decode(response.body)['articles'];
      return articlesJson.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
