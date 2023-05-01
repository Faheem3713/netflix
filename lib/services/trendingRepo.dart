import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/model/search_model.dart';
import 'package:netflix/services/apiservices.dart';
import 'package:netflix/model/get_list.dart';
import 'package:netflix/model/trending.dart';

class TrendingRepo {
  TrendingRepo._privateConstructor();
  static final instance = TrendingRepo._privateConstructor();
  ValueNotifier<List<String>> trendingNotifier = ValueNotifier([]);
  ValueNotifier<List<Trending>> popularNotifier = ValueNotifier([]);
  ValueNotifier<List<String>> topRatedNotifier = ValueNotifier([]);
  Future<List> getData() async {
    try {
      Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.trendingApi);
      if (response.statusCode == 200) {
        final result = response.data['results'] as List;

        trendingNotifier.value = List.generate(result.length,
            (index) => ApiEndPoints.imageApi + result[index]['poster_path']);
        return [];
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<Either<MainFailures, List<Trending>>> getPopular() async {
    await getData();
    try {
      Response response = await Dio(BaseOptions()).get(ApiEndPoints.popular);

      if (response.statusCode == 200) {
        final result = (response.data['results'] as List)
            .map((e) => Trending.fromJson(e))
            .toList();
        popularNotifier.value.addAll(result);
        return right(result);
      } else {
        return left(const MainFailures.serverFailures());
      }
    } catch (e) {
      return left(const MainFailures.clientFailures());
    }
  }

  getRated() async {
    await getPopular();
    Response response = await Dio(BaseOptions()).get(ApiEndPoints.topRated);
    final List result = response.data['results'] as List;
    topRatedNotifier.value.clear();
    topRatedNotifier.value = List.generate(result.length,
        (index) => ApiEndPoints.imageApi + result[index]['poster_path']);
  }







  Future<Either<MainFailures, List<SearchModel>>> searchMovies(
      String name) async {
    try {
      Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.searchUrl(name));

      if (response.statusCode == 200) {
        final result = (response.data['results'] as List)
            .map((e) => SearchModel.fromJson(e))
            .toList();

        return right(result);
      } else {
        return left(const MainFailures.serverFailures());
      }
    } catch (e) {
      log(e.toString());
      return left(const MainFailures.clientFailures());
    }
  }

   createList() async {
    try {
      Response response = await Dio(BaseOptions()).post(ApiEndPoints.createList,
          data: {
            "name": "This is new list.",
            "description": "Just a list.",
            "language": "en"
          });
    } catch (e) {
      log(e.toString());
    }
    await getMovieList();
  }

  deleteList(int id) async {
    String deleteUrl =
        'https://api.themoviedb.org/3/list/$id?api_key=5fda37ebf34ddf1eff5108b47b582820&session_id=d77f7c345f75b52ac8ba601b1e0a8b21af928086';

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
    Response response = await Dio(BaseOptions()).get(ApiEndPoints.getList);
    final result =
        (response.data['results'] as List).map((e) => MyList.fromJson(e));
    myListNotifier.value.clear();
    myListNotifier.value.addAll(result);
    myListNotifier.notifyListeners();
  }

  ValueNotifier<List<Trending>> newAndHot = ValueNotifier([]);
  newAndhot() async {
    Response response = await Dio(BaseOptions()).get(ApiEndPoints.popular);
    final result = (response.data['results'] as List)
        .map((e) => Trending.fromJson(e))
        .toList();
    newAndHot.value.clear();
    newAndHot.value.addAll(result);
    newAndHot.notifyListeners();
  }

}
