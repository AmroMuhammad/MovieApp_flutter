import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_response.dart';
import 'movie_details.dart';

class MyMovieListPage extends StatefulWidget {
  MyMovieListPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyMovieListPage createState() => _MyMovieListPage();
}

class _MyMovieListPage extends State<MyMovieListPage> {

  List<Results> movieResults = [];

  Future<List<Results>> getMovies() async {
    print("hello from getmovies");
    var response = await Dio().get("https://api.themoviedb.org/3/movie/now_playing",queryParameters: {'api_key': "f55fbda0cb73b855629e676e54ab6d8e"});
    print(response.statusCode);
    // ApiResponse aa = ApiResponse.fromJson(response.data);
    print(response.data);
    // print("${movieModel.page} a7aaaaaaaaaaa");
    // for (var item in movieModel.results){
    //   Results movie = Results.fromJson(item);
    //   movieResults.add(movie);
    // }
    return movieResults;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color(0xFF0F1B40),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder(future: getMovies(),
      builder: (context,snapshot){
        print(snapshot.connectionState);
        print(movieResults.length);
        return ListView.builder(
            itemCount: movieResults.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
                  onTap:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MovieDetailsPage(title: "moviee",)),
                    );
                  },
                  child:Container(
                      height: 100,
                      color: const Color(0xFF0F1B40),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(movieResults[index].posterPath,
                                    height: 75.0, width: 125.0, fit: BoxFit.fill),
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 2.5),
                                  child: Text(
                                    movieResults[index].posterPath,
                                    style: TextStyle(color: Colors.white),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 2.5),
                                  child: Text(movieResults[index].posterPath,
                                      style: TextStyle(color: Colors.grey))),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.blueGrey,
                                      size: 15.0,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                                        child: Text(movieResults[index].posterPath,
                                            style: TextStyle(color: Colors.grey))),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2.5, 0, 0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          color: Colors.blueGrey,
                                          size: 15.0,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                                            child: Text(movieResults[index].posterPath,
                                                style: TextStyle(color: Colors.grey))),
                                      ],
                                    ),
                                  )),
                            ],
                          )
                        ],
                      )));
            });
      },)
      ,
    );
  }
}
