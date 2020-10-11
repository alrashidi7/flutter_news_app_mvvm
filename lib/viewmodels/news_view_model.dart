import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/newsModel.dart';
import 'package:flutter_news_app/screens/new_article_details_screen.dart';
import 'package:http/http.dart'as http;
import 'dart:convert' as convert;
import 'package:dio/dio.dart';


class NewsViewModel{
  var dio = new Dio();
  Future<List<NewsArticleModel>> fetchTopHeadlines() async {
    final response = await dio.get("https://newsapi.org/v2/top-headlines?country=us&apiKey=efc603ca092e43978bc1af9257ab8089");

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticleModel.fromJson(article)).toList();
    } else {
      throw Exception("Failled to get top news");
    }
  }

  goToDetails(
      BuildContext context,
      String title,
      String author,
      String description,
      String urlToImage,
      String url,
      String publishedAt,
      String content,){

    Navigator.of(context).pushNamed('articleDetails',arguments:
    new ArticleDetails(
        title,
        author,
        description,
        urlToImage,
        url,
        publishedAt,
        content)
    );
  }

}