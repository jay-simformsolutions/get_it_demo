import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it_demo/model/article_model.dart';
import 'package:get_it_demo/model/user_profile_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  Repository() {
    print('Repository object created');
  }

  Future<List<UserProfile>> getUserProfileList() async {
    List<UserProfile> userProfileList = [];
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      final data = jsonDecode(response.body);
      userProfileList =
          data.map<UserProfile>((e) => UserProfile.fromJson(e)).toList();
    } catch (e, s) {
      debugPrint('Exception is $e');
      debugPrintStack(stackTrace: s);
    }
    return userProfileList;
  }

  Future<List<Articles>> getArticleData() async {
    List<Articles> articles = [];
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ba89c4b854574840a6b56cd4a3bf8069"));
      final data = jsonDecode(response.body);
      final articleModel = ArticleModel.fromJson(data);
      articles = articleModel.articles;
      debugPrint('Articles data are $data');
    } catch (e, s) {
      debugPrint('Exception is $e');
      debugPrintStack(stackTrace: s);
    }
    return articles;
  }
}
