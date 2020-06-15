import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutterblocmovies/src/model/movies/Trailer.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class MovieDetailBloc {
  final _repository = Repository();
  final _movieId = PublishSubject<int>();
  final _trailers = BehaviorSubject<Future<Trailer>>();

  Function(int) get fetchTrailersById => _movieId.sink.add;
  Stream<Future<Trailer>> get movieTrailers => _trailers.stream;

  MovieDetailBloc() {
    _movieId.stream.transform(_itemTransformer()).pipe(_trailers);
  }

  dispose() async {
    _movieId.close();
    await _trailers.drain();
    _trailers.close();
  }

  _itemTransformer() {
    return ScanStreamTransformer(
          (Future<Response<Trailer>> trailer, int id, int index) {
        print(index);
        trailer = _repository.fetchTrailers(id.toString());
        return trailer;
      },
    );
  }
}