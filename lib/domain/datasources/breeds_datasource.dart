import 'package:http/http.dart' as http;

import 'package:catbreeds/domain/entities/breed_entity.dart';



abstract class AbstractBreedsDatasource {

  Future<List<BreedEntity>> getCatBreeds(http.Client httpClient);

  Future<List<String>> getCatBreedImagesURLs(http.Client httpClient, {required String breedId});

}