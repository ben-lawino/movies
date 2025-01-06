import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies/movie_detail.dart';
import 'package:movies/service/http_helper.dart';


class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final String iconBase = 'https://image.tmdb.org/t/p/w92'; //path for poster icons
  final String defaultImage = 'https://image.freeimages.com/images/large_previews/5eb/movie-clapboard-1184339.jpg'; //path for default image incase poster icon not available
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
    NetworkImage image;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
        body: ListView.builder(
            itemBuilder: (BuildContext context, int position){
              if (movies[position].posterPath != null){
                image = NetworkImage(iconBase + movies[position].posterPath);
              }
              else
                image = NetworkImage(defaultImage);
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  onTap: (){
                    MaterialPageRoute route = MaterialPageRoute(
                        builder: (_) => MovieDetail(movie:movies[position]));
                    Navigator.push(context,route);
                  },
                  leading:  CircleAvatar(
                    backgroundImage: image,
                  ),
                  title: Text(movies[position].title) ,
                  subtitle: Text('Released: '
                  + movies[position].releaseDate + ' - Vote: ' + movies[position].voteAverage.toString()),
                ),
              );
            },
        itemCount: (this.moviesCount == null)?0 : this.moviesCount)
    );
  }
}
