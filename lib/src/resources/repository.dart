import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutterblocmovies/src/model/movies.dart';
import 'package:flutterblocmovies/src/resources/retrofit_client.dart';

class Repository {
  final moviesApiProvider = RetrofitClientInstance.getInstance();

  Future<Response<Movies>> fetchAllMovies() => moviesApiProvider.getDataService().getMovies();

  //Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}
