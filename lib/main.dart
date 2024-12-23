import 'package:flutter/material.dart';
import 'package:movies/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
            appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white
      )
      ),
      home: Home(),
    );
  }
}

