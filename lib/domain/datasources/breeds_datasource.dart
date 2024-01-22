import 'package:http/http.dart';

import 'package:catbreeds/domain/entities/breed_entity.dart';



abstract class AbstractBreedsDatasource {

  final Client httpClient;
  final Map<String, String>? headers;

  AbstractBreedsDatasource(this.httpClient, this.headers);

  Future<List<BreedEntity>> getCatBreeds();

  Future<List<String>> getCatBreedImagesURLs(String breedId);

}