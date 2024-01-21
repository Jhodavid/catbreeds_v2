import 'package:catbreeds/domain/services/abstract_dio_service.dart';


import 'package:dio/dio.dart';



class CatApiDioService extends AbstractDioService {

  static final catApiDio = Dio();
  static String urlService = "https://api.thecatapi.com/v1";

  @override
  void configureDio() {
    catApiDio.options.baseUrl = urlService;

    catApiDio.options.contentType = Headers.jsonContentType;
    catApiDio.options.contentType = Headers.jsonContentType;
    catApiDio.options.responseType = ResponseType.json;
    catApiDio.options.validateStatus = (status) => status! <= 500;
  }

  @override
  void configureApiKey(String apiKey) {
    catApiDio.options.headers = {
      'x-api-key': apiKey
    };
  }
}