import 'package:flutter/material.dart';
import 'movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath ='https://image.tmdb.org/t/p/w500/';

  const MovieDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    String path;
    if (movie.posterPath != null){
      path = imgPath + movie.posterPath;
    }
    else{
      path = 'https://image.freeimages.com/images/large_previews/5eb/movie-clapboard-1184339.jpg';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                height: height / 1.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50), // Match the container's radius
                  child: Image.network(
                    path,
                    fit: BoxFit.cover,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
