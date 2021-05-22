import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lab02/results.dart';

import 'api_response.dart';
import 'database.dart';

class MovieModel extends ChangeNotifier{
  List<Results> _nowPlayingMovies = List();
  List<Results> _popularMovies = List();
  List<Results> _upcomingMovies = List();
  List<Results> _topRatedMovies = List();
  AppDatabase _database = AppDatabase();
  List<Results> _dbMovies = List();



  List<Results> get nowPlayingMovies => _nowPlayingMovies;
  List<Results> get popularMovies => _popularMovies;
  List<Results> get upcomingMovies => _upcomingMovies;
  List<Results> get topRatedMovies => _topRatedMovies;
  List<Results> get dbMovies => _dbMovies;


  // addMovie(Results result){
  //   _movies.add(result);
  //   notifyListeners();
  // }

  getNowPlayingMovies() async {
    _nowPlayingMovies = [];
    print("hello from getmovies");
    var response = await Dio().get(
        "https://api.themoviedb.org/3/movie/now_playing",
        queryParameters: {'api_key': "f55fbda0cb73b855629e676e54ab6d8e"});
    print(response.statusCode);
    print(response.data["results"]);
    //(response.data["results"] as List).map((item) => Results.fromJson(item)).toList();
    ApiResponse res = ApiResponse.fromJson(response.data);
    _nowPlayingMovies = res.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularMovies = [];
    print("hello from getmovies");
    var response = await Dio().get(
        "https://api.themoviedb.org/3/movie/popular",
        queryParameters: {'api_key': "f55fbda0cb73b855629e676e54ab6d8e"});
    print(response.statusCode);
    print(response.data["results"]);
    //(response.data["results"] as List).map((item) => Results.fromJson(item)).toList();
    ApiResponse res = ApiResponse.fromJson(response.data);
    _popularMovies = res.results;
    notifyListeners();
  }

  getTopRatedMovies() async {
    _topRatedMovies = [];
    print("hello from getmovies");
    var response = await Dio().get(
        "https://api.themoviedb.org/3/movie/top_rated",
        queryParameters: {'api_key': "f55fbda0cb73b855629e676e54ab6d8e"});
    print(response.statusCode);
    print(response.data["results"]);
    //(response.data["results"] as List).map((item) => Results.fromJson(item)).toList();
    ApiResponse res = ApiResponse.fromJson(response.data);
    _topRatedMovies = res.results;
    notifyListeners();
  }

  getUpcomingMovies() async {
    _upcomingMovies = [];
    print("hello from getmovies");
    var response = await Dio().get(
        "https://api.themoviedb.org/3/movie/upcoming",
        queryParameters: {'api_key': "f55fbda0cb73b855629e676e54ab6d8e"});
    print(response.statusCode);
    print(response.data["results"]);
    //(response.data["results"] as List).map((item) => Results.fromJson(item)).toList();
    ApiResponse res = ApiResponse.fromJson(response.data);
    _upcomingMovies = res.results;
    notifyListeners();
  }

  addPhototoDatabase(Results movie){
    _database.insertMovie(movie);
    notifyListeners();
  }

  getDBMovies(){
    _database.getMovies().then((movies) => _dbMovies = movies);
    notifyListeners();
  }
}