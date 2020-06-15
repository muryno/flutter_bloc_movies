// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_rest_client.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiRestClient extends ApiRestClient {
  _$ApiRestClient([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiRestClient;

  Future<Response<Movies>> getMovies() {
    final $url =
        'http://api.themoviedb.org/3/movie/popular?api_key=bc682e0f689f1086b5637a08c4357d9c';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Movies, Movies>($request);
  }

  Future<Response<Trailer>> getTrailer(String id) {
    final $url =
        'http://api.themoviedb.org/3/movie/${id}/videos?api_key=bc682e0f689f1086b5637a08c4357d9c';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Trailer, Trailer>($request);
  }
}
