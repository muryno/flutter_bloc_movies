import 'package:flutterblocmovies/src/model/movies.dart';
import 'package:flutterblocmovies/src/utils/url_constant.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import "dart:async";
import 'package:chopper/chopper.dart';



part "api_rest_client.chopper.dart";

@ChopperApi(baseUrl: UrlConstant.BASE_URL)
abstract class ApiRestClient extends ChopperService  {

  static ApiRestClient create([ChopperClient client]) =>    _$ApiRestClient(client);


  @Get(path: "/popular?api_key=${UrlConstant.API_KEY}")
  Future<Response<Movies>> getMovies();






}
