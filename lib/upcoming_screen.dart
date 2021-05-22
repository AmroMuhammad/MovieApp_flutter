
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lab02/movie_model.dart';
import 'package:lab02/results.dart';
import 'package:provider/provider.dart';

import 'api_response.dart';
import 'movie_details.dart';

class UpcomingScreen extends StatelessWidget {
  UpcomingScreen({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  Widget build(BuildContext context) {
    Provider.of<MovieModel>(context,listen: false).getUpcomingMovies();

    return Consumer<MovieModel>(builder: (_,model,__) {
      return ListView.builder(
          itemCount: model.upcomingMovies.length ,
          itemBuilder: (context, int index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetailsPage(
                          movieDetails: model.upcomingMovies[index],
                        )),
                  );
                },
                child: Container(
                    height: 100,
                    color: const Color(0xFF0F1B40),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Hero(
                                  tag:"${model.upcomingMovies[index].id}",
                                  child:Image.network(
                                      model.upcomingMovies[index].posterPath,
                                      height: 75.0,
                                      width: 125.0,
                                      fit: BoxFit.fill)),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 2.5),
                                child: Text(
                                  model.upcomingMovies[index].originalTitle,
                                  style: TextStyle(color: Colors.white),
                                )),
                            RatingBar.builder(
                              initialRating: model.upcomingMovies[index].voteAverage/2,
                              minRating: 1,
                              itemSize: 10,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                              EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                                child: Text(
                                    model.upcomingMovies[index]
                                        .voteCount
                                        .toString() +
                                        " reviews",
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
                                      padding:
                                      EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                                      child: Text(
                                          model.upcomingMovies[index]
                                              .popularity
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.grey))),
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
                                          padding: EdgeInsets.fromLTRB(
                                              2.5, 0, 0, 0),
                                          child: Text(
                                              model.upcomingMovies[index]
                                                  .releaseDate,
                                              style: TextStyle(
                                                  color: Colors.grey))),
                                    ],
                                  ),
                                )),
                          ],
                        )
                      ],
                    )));
          });
    }
    );

  }
}