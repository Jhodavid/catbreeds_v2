
import 'package:catbreeds/domain/entities/breed_entity.dart';


abstract class AbstractBreedsRepository {

  Future<List<BreedEntity>?> getBreeds();

  Future<List<String>?> getBreedImages(String breedId);

}