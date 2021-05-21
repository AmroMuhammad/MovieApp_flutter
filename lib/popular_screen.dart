import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lab02/results.dart';

import 'api_response.dart';
import 'movie_details.dart';

class PopularScreen extends StatefulWidget {
  PopularScreen({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _PopularScreen createState() => _PopularScreen();
}

class _PopularScreen extends State<PopularScreen> {
  List<Results> movieResults = [];

  Future<List<Results>> getMovies() async {
    print("hello from getmovies");
    var response = await Dio().get(
        "https://api.themoviedb.org/3/movie/popular",
        queryParameters: {'api_key': "f55fbda0cb73b855629e676e54ab6d8e"});
    print(response.statusCode);
    print(response.data["results"]);
    //(response.data["results"] as List).map((item) => Results.fromJson(item)).toList();
    ApiResponse res = ApiResponse.fromJson(response.data);
    movieResults = res.results;
    return res.results;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return FutureBuilder<Object>(
        future: getMovies(),
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: movieResults.length,
              itemBuilder: (context,index){
                return GestureDetector(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetailsPage(
                          movieDetails: movieResults[index],
                        )),
                  );
                },child:Card(
                    color: Colors.grey[800],
                    child: Image.network(movieResults[index].posterPath,fit: BoxFit.fill,))
                  ,);
              });
        },
    );
  }
}