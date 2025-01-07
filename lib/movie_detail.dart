import 'package:flutter/material.dart';
import 'movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie; // Movie object containing details
  final String imgPath = 'https://image.tmdb.org/t/p/w500/'; // Base URL for movie posters

  const MovieDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // Get screen height

    String path = imgPath + movie.posterPath; // Full path for the poster image

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Movie poster
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)), // Rounded bottom corners
                  child: SizedBox(
                    height: height / 1.42,
                    child: Image.network(
                      path,
                      fit: BoxFit.cover, // Cover the available space
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Movie title
              Text(
                movie.title,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              // Release date and vote average
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        movie.releaseDate,
                        style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Release Date',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black45),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        movie.voteAverage.toString(),
                        style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Votes',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black45),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Back button
              Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Navigate back to the previous screen
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
