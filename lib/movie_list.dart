import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  int _counter = 0;
  List moviesImage = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    "assets/images/6.jpg",
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    "assets/images/6.jpg"
  ];
  List movieTitle = [
    "Avengers: End Game",
    "Pacific Rim",
    "Harry Potter",
    "the italian job",
    "Ruby Sparks",
    "The Intern",
    "Avengers: End Game",
    "Pacific Rim",
    "Harry Potter",
    "the italian job",
    "Ruby Sparks",
    "The Intern"
  ];
  List ratings = [
    "20k reviews",
    "15k reviews",
    "15k reviews",
    "12k reviews",
    "200k reviews",
    "125k reviews",
    "20k reviews",
    "15k reviews",
    "15k reviews",
    "12k reviews",
    "200k reviews",
    "125k reviews"
  ];
  List time = [
    "2h 30M",
    "2h 30M",
    "3h 30M",
    "2h 00M",
    "1h 30M",
    "2h 30M",
    "2h 30M",
    "2h 30M",
    "3h 30M",
    "2h 00M",
    "1h 30M",
    "2h 30M"
  ];
  List date = [
    "2021/5/3",
    "2000/5/3",
    "4545/5/3",
    "4554/5/3",
    "5434/5/3",
    "1898/5/3",
    "2021/5/3",
    "2000/5/3",
    "4545/5/3",
    "4554/5/3",
    "5434/5/3",
    "1898/5/3"
  ];

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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: movieTitle.length,
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
                          child: Image.asset(moviesImage[index],
                              height: 75.0, width: 125.0, fit: BoxFit.fill),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 2.5),
                            child: Text(
                              movieTitle[index],
                              style: TextStyle(color: Colors.white),
                            )),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 2.5),
                            child: Text(ratings[index],
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
                                  child: Text(time[index],
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
                                child: Text(date[index],
                                      style: TextStyle(color: Colors.grey))),
                                ],
                              ),
                            )),
                      ],
                    )
                  ],
                )));
          }),
    );
  }
}
