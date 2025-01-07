import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/movie_detail.dart';
import 'package:movies/service/http_helper.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  Icon visibleIcon = const Icon(Icons.search); // Controls the search icon state
  Widget searchBar = const Text('Movies'); // Displays the current search bar state

  final String iconBase =
      'https://image.tmdb.org/t/p/w92'; // Path for poster icons
  final String defaultImage =
      'https://image.freeimages.com/images/large_previews/5eb/movie-clapboard-1184339.jpg'; // Default image path
  int moviesCount = 0; // Tracks the number of movies
  List movies = []; // List to store movie data
  late HttpHelper helper; // Helper for API calls

  // Initializes the movie list with upcoming movies
  Future initialize() async {
    movies = [];
    movies = (await helper.getUpcoming())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  // Searches for movies based on the entered text
  Future search(text) async {
    movies = (await helper.findMovies(text))!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    helper = HttpHelper(); // Initialize the API helper
    initialize(); // Fetch initial movie data
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NetworkImage image;

    return Scaffold(
      appBar: AppBar(
        title: searchBar, // Displays search bar or title
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (visibleIcon.icon == Icons.search) {
                  // Switch to search mode
                  visibleIcon = const Icon(Icons.cancel);
                  searchBar = TextField(
                    onSubmitted: (String text) {
                      search(text); // Search movies
                    },
                    textInputAction: TextInputAction.search,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  );
                } else {
                  // Switch back to default mode
                  visibleIcon = const Icon(Icons.search);
                  searchBar = const Text('Movies');
                }
              });
            },
            icon: visibleIcon,
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          if (movies[position].posterPath != null) {
            image = NetworkImage(iconBase + movies[position].posterPath); // Use movie poster
          } else {
            image = NetworkImage(defaultImage); // Use default image
          }
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              onTap: () {
                // Navigate to the movie detail page
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetail(movie: movies[position]));
                Navigator.push(context, route);
              },
              leading: CircleAvatar(
                backgroundImage: image,
              ),
              title: Text(movies[position].title), // Movie title
              subtitle: Text(
                  '${'Released: ' + movies[position].releaseDate} - Vote: ${movies[position].voteAverage}'), // Release date and rating
            ),
          );
        },
        itemCount: moviesCount, // Number of movies in the list
      ),
    );
  }
}
