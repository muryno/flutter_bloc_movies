
import 'package:chopper/chopper.dart';
import 'package:flutterblocmovies/src/model/movies.dart';
import 'package:flutterblocmovies/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject< Response<Movies>>();

  Stream< Response<Movies>> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    Response<Movies> itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
