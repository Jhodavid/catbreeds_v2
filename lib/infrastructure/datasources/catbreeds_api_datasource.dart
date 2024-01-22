import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:catbreeds/domain/entities/breed_entity.dart';
import 'package:catbreeds/domain/datasources/breeds_datasource.dart';

import 'package:catbreeds/infrastructure/models/app_errors.dart';
import 'package:catbreeds/infrastructure/models/breeds_response.dart';
import 'package:catbreeds/infrastructure/models/breed_image_response.dart';

import 'package:catbreeds/infrastructure/mappers/catbreeds_api_mapper.dart';



class CatbreedsApiDatasource extends AbstractBreedsDatasource {

  CatbreedsApiDatasource();

  @override
  Future<List<BreedEntity>> getCatBreeds(httpClient) async {
    try {
      final response = await httpClient.get(
        Uri.parse('https://api.thecatapi.com/v1/breeds')
      );

      if(response.statusCode != 200) {
        throw CustomError('No Data');
      }

      final data = jsonDecode(response.body);
      final breedsResponse = List<BreedResponse>.from(
        data.map((json) => BreedResponse.fromJson(json))
      );

      final breedList = List<BreedEntity>.from(
        breedsResponse.map((breed) => BreedsCatApiMapper.breedToEntity(breed))
      );

      return breedList;
    } catch (e) {
      if(kDebugMode) print(e);
      throw ConnectionError();
    }
  }

  @override
  Future<List<String>> getCatBreedImagesURLs(httpClient, {required String breedId}) async {
    try {
      final response = await httpClient.get(
        Uri.parse('https://api.thecatapi.com/v1/images/search?limit=3&breed_ids=$breedId')
      );

      if(response.statusCode != 200) {
        throw CustomError('No Data');
      }

      final data = jsonDecode(response.body);
      final breedImagesResponse = List<BreedImageResponse>.from(
        data.map((json) => BreedImageResponse.fromJson(json))
      );

      final breedImages = List<String>.from(
        breedImagesResponse.map((image) => BreedsCatApiMapper.breedImageUrlFromBreedImageResponse(image))
      );

      return breedImages;
    } catch (e) {
      if(kDebugMode) print(e);
      throw ConnectionError();
    }
  }
}