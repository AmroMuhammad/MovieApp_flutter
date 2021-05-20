import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailsPage extends StatefulWidget {
  MovieDetailsPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  String movieName;

  @override
  _MovieDetailsPage createState() => _MovieDetailsPage();
}

class _MovieDetailsPage extends State<MovieDetailsPage> {
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
          Image.asset("assets/images/1.jpg"),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
              child: Text(
                "Avengers: End Game",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Text(
                "20k reviews",
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
                    Text("2H 30M",
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
                    Text("2020/3/15", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Text(
                "Avengers: Endgame is a 2019 American superhero film based on the Marvel Comics superhero team the Avengers. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is the direct sequel to Avengers: Infinity War (2018) and the 22nd film in the Marvel Cinematic Universe (MCU). Directed by Anthony and Joe Russo and written by Christopher Markus and Stephen McFeely, the film features an ensemble cast including Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson, Jeremy Renner.",
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              ))
        ],
      ),
    );
  }
}
