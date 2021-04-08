import 'package:flutter/material.dart';
import 'package:flutter_katalogfilm/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
          decoration: buildBoxDecoration(),
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(16),
                  height: height / 1.5,
                  child: Image.network(path)),
              Container(
                child: Text(
                  movie.overview,
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.only(left: 16, right: 16),
              )
            ],
          ),
        ))));
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          //jumlah stop berbanding lurus dengan jumlah warna
          stops: [0.3, 0.6, 0.9],
          colors: [
            Color.fromRGBO(0, 0, 0, 1), //red-green-blue-o
            Color.fromRGBO(105, 105, 105, 1),
            Color.fromRGBO(128, 128, 128, 1),
          ],
        ),
        boxShadow: []);
  }
}
