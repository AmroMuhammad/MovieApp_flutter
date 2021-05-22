import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab02/results.dart';

class MovieDetailsPage extends StatefulWidget {
  MovieDetailsPage({Key key, this.movieDetails}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  Results movieDetails;

  @override
  _MovieDetailsPage createState() => _MovieDetailsPage(movieDetails);
}

class _MovieDetailsPage extends State<MovieDetailsPage> {
  _MovieDetailsPage(this.movieDetails);

  Results movieDetails;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 500,
            height: 200,
            child: Hero(
                tag: "${movieDetails.id}",
                child: Image.network(
                  movieDetails.posterPath,
                  fit: BoxFit.fill,
                )),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
              child: Row(
                children: [
                  Text(
                    movieDetails.originalTitle,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        print("favourite pressed");
                      },
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.blueGrey,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
              child: Text(
                "${movieDetails.voteCount} reviews",
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.blueGrey,
                      size: 15.0,
                    ),
                    Text(movieDetails.popularity.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 15.0)),
                  ],
                ),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.blueGrey,
                      size: 15.0,
                    ),
                    Text(movieDetails.releaseDate.toString(),
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Text(
                movieDetails.overview,
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              ))
        ],
      ),
    );
  }
}
