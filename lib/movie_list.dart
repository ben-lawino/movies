import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies/service/http_helper.dart';


class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  List movies = [];
  late HttpHelper helper;

  Future initialize() async {
    movies = [];
    movies = (await helper.getUpcoming())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }




  @override
    void initState(){
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
        body: ListView.builder(
            itemBuilder: (BuildContext context, int position){
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  title: Text(movies[position].title) ,
                  subtitle: Text('Released: '
                  + movies[position].releaseDate + ' - Vote: ' + movies[position].voteAverage.toString()),
                ),
              );
            },
        itemCount: moviesCount,)
    );
  }
}
