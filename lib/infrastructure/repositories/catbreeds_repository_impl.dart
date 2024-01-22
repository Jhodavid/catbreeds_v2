import 'package:catbreeds/config/app_environment.dart';
import 'package:http/http.dart' as http;

import 'package:catbreeds/domain/entities/breed_entity.dart';
import 'package:catbreeds/domain/repositories/abstract_breeds_repository.dart';
import 'package:catbreeds/infrastructure/datasources/catbreeds_api_datasource.dart';



class CatbreedsRepositoryImpl extends AbstractBreedsRepository {

  final CatbreedsApiDatasource breedsDatasource;

  CatbreedsRepositoryImpl(this.breedsDatasource);


  @override
  Future<List<String>?> getBreedImages(String breedId) async {
    return breedsDatasource.getCatBreedImagesURLs(breedId);
  }

  @override
  Future<List<BreedEntity>?> getBreeds() {
    return breedsDatasource.getCatBreeds();
  }

}