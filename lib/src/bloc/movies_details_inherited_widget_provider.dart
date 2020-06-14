import 'package:flutter/material.dart';

class MovieDetailBlocProvider extends InheritedWidget {
 // final MovieDetailBloc bloc;

  MovieDetailBlocProvider({Key key, Widget child}):
       // bloc = MovieDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

//  static MovieDetailBloc of(BuildContext context) {
//    return (context.dependOnInheritedWidgetOfExactType()
//    as MovieDetailBlocProvider).bloc;
//  }
}
