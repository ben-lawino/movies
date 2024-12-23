import 'package:flutter/material.dart';
import 'package:movies/movie_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MovieList();
  }
}