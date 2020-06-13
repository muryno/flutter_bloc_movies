import 'package:flutter/material.dart';
import 'package:flutterblocmovies/src/ui/movies.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Movie(),
      ),
    );



  }


}
