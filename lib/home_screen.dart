import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lab02/now_playing_screen.dart';
import 'package:lab02/popular_screen.dart';
import 'package:lab02/top_rated_screen.dart';
import 'package:lab02/upcoming_screen.dart';

import 'movie_details.dart';

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key key, this.title}) : super(key: key);

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

class _MyMovieListPage extends State<MyHomeScreen> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(length: 4, child:
      Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.grey[900],
        leading: GestureDetector(
          onTap: () {
            print("HomeIcon Pressed");
          },
          child: Icon(Icons.home_rounded),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print("Favourite Pressed");
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Favourite"),
              ),
            ),
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: Colors.amber,
          tabs: [
            Tab(text:"Popular",),
            Tab(text: "Now Playing",),
            Tab(text: "top Rated",),
            Tab(text: "Upcoming",),
          ],
        ),
      ),
        body: TabBarView(children: [
          PopularScreen(),
          NowPlayingScreen(),
          TopRatedScreen(),
          UpcomingScreen(),
        ],),
    ));
  }
}
