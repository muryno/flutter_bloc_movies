import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutterblocmovies/src/model/movies.dart';
import 'package:flutterblocmovies/src/utils/url_constant.dart';

import 'api_rest_client.dart';


class RetrofitClientInstance{
  static RetrofitClientInstance _instance = RetrofitClientInstance._internal();

//  reset(){
//    StorageUtil.getUser().then((value){
//         _instance = RetrofitClientInstance._internal(value.authorization);
//    });
//  }

  RetrofitClientInstance._internal([String token = '']){
    _chopper = ChopperClient(
        baseUrl: UrlConstant.BASE_URL,
        services: [ApiRestClient.create() ],
        interceptors: [
          HeadersInterceptor({ 'X-Auth-Token': token, }),
              (Request request) async {
                chopperLogger.info(request);
                return request;
              },
              (Response response) async {
                chopperLogger.info(response);
                return response;
              },
        ],
        converter: JsonToTypeConverter({ Movies: (jsonData) => Movies.fromJson(jsonData)}),
        errorConverter: JsonConverter()
    );
    _client = _chopper.getService<ApiRestClient>();
  }

  ApiRestClient _client;
  ChopperClient _chopper;




  static RetrofitClientInstance getInstance() {
    return _instance;
  }

  ApiRestClient getDataService() {
    return _client;
  }

}

class JsonToTypeConverter extends JsonConverter {

  final Map<Type, Function> typeToJsonFactoryMap;

  JsonToTypeConverter(this.typeToJsonFactoryMap);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.replace(
      body: fromJsonData<BodyType, InnerType>(response.body, typeToJsonFactoryMap[InnerType]),
    );
  }

  T fromJsonData<T, InnerType>(String jsonData, Function jsonParser) {
    var jsonMap = json.decode(jsonData);

    if (jsonMap is List) {
      return jsonMap.map((item) => jsonParser(item as Map<String, dynamic>) as InnerType).toList() as T;
    }

    return Movies.fromJson(jsonMap) as T;
  }
}

