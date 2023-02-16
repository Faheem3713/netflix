import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix/functions/apiservices.dart';
import 'package:netflix/model/get_list.dart';
import 'package:netflix/model/trending.dart';

class TrendingRepo {
  TrendingRepo._privateConstructor();
  static final instance = TrendingRepo._privateConstructor();
  ValueNotifier<List<String>> trendingNotifier = ValueNotifier([]);
  ValueNotifier<List<String>> popularNotifier = ValueNotifier([]);
  ValueNotifier<List<String>> topRatedNotifier = ValueNotifier([]);
  getData() async {
    Response response = await Dio(BaseOptions()).get(ApiServices.trendingApi);
    final result = response.data['results'] as List;
    trendingNotifier.value.clear();
    trendingNotifier.value = List.generate(result.length,
        (index) => ApiServices.imageApi + result[index]['poster_path']);
  }

  getPopular() async {
    await getData();
    Response response = await Dio(BaseOptions()).get(ApiServices.popular);
    final result = response.data['results'] as List;
    popularNotifier.value.clear();
    popularNotifier.value = List.generate(result.length,
        (index) => ApiServices.imageApi + result[index]['poster_path']);
  }

  getRated() async {
    await getPopular();
    Response response = await Dio(BaseOptions()).get(ApiServices.topRated);
    final List result = response.data['results'] as List;
    topRatedNotifier.value.clear();
    topRatedNotifier.value = List.generate(result.length,
        (index) => ApiServices.imageApi + result[index]['poster_path']);
  }

  ValueNotifier<List<Trending>> searchNotifier = ValueNotifier([]);
  searchMovies(String name) async {
    try {
      String searchUrl =
          "https://api.themoviedb.org/3/search/movie?api_key=5fda37ebf34ddf1eff5108b47b582820&language=en-US&query=$name&page=1&include_adult=false";
      Response response = await Dio(BaseOptions()).get(searchUrl);
      final result =
          (response.data['results'] as List).map((e) => Trending.fromJson(e));
      searchNotifier.value.clear();
      searchNotifier.value.addAll(result);
      searchNotifier.notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  createList() async {
    try {
      Response response = await Dio(BaseOptions()).post(ApiServices.createList,
          data: {
            "name": "This is new list.",
            "description": "Just a list.",
            "language": "en"
          });
      print(response.data);
    } catch (e) {
      log(e.toString());
    }
    await getMovieList();
  }

  deleteList(int id) async {
    String deleteUrl =
        'https://api.themoviedb.org/3/list/$id?api_key=5fda37ebf34ddf1eff5108b47b582820&session_id=d77f7c345f75b52ac8ba601b1e0a8b21af928086';
    print(deleteUrl);
    try {
      //   Response response = await Dio(BaseOptions()).delete(deleteUrl);
      //    print(response.data);
    } catch (e) {
      log(e.toString());
    }
    await getMovieList();
  }

  ValueNotifier<List<MyList>> myListNotifier = ValueNotifier([]);
  getMovieList() async {
    Response response = await Dio(BaseOptions()).get(ApiServices.getList);
    final result =
        (response.data['results'] as List).map((e) => MyList.fromJson(e));
    myListNotifier.value.clear();
    myListNotifier.value.addAll(result);
    myListNotifier.notifyListeners();
  }
}
