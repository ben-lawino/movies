import 'package:flutter/material.dart';
import 'movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  const MovieDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://image.freeimages.com/images/large_previews/5eb/movie-clapboard-1184339.jpg';
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight:
                        Radius.circular(40)), // Match the container's radius
                child: SizedBox(
                  height: height / 1.4,
                  child: Image.network(
                    path,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              movie.title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      movie.releaseDate,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Release Date',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black45),
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      movie.voteAverage.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Votes',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black45),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: Colors.deepOrange, shape: BoxShape.circle),
              child: GestureDetector(
                onTap:() {Navigator.of(context).pop();},
                  child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
            )
          ],
        ),
      ),
    );
  }
}
