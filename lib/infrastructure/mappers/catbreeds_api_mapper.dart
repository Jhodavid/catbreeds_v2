import 'package:catbreeds/domain/entities/breed_entity.dart';
import 'package:catbreeds/infrastructure/models/breed_image_response.dart';
import 'package:catbreeds/infrastructure/models/breeds_response.dart';



class BreedsCatApiMapper {

  static BreedEntity breedToEntity( 
    BreedResponse breed 
  ) => BreedEntity(
    id: breed.id, 
    name: breed.name, 
    weight: breed.weight.metric, 
    origin: breed.origin, 
    lifeSpan: breed.lifeSpan,
    imagesUrls: const [],
    description: breed.description, 
    adaptability: breed.adaptability, 
    affectionLevel: breed.affectionLevel, 
    childFriendly: breed.childFriendly, 
    dogFriendly: breed.dogFriendly, 
    energyLevel: breed.energyLevel, 
    grooming: breed.grooming, 
    healthIssues: breed.healthIssues, 
    intelligence: breed.intelligence, 
    sheddingLevel: breed.sheddingLevel, 
    socialNeeds: breed.socialNeeds, 
    strangerFriendly: breed.strangerFriendly, 
    vocalisation: breed.vocalisation, 
    experimental: breed.experimental, 
    hairless: breed.hairless, 
    natural: breed.natural, 
    rare: breed.rare, 
    rex: breed.rex, 
    suppressedTail: breed.suppressedTail, 
    shortLegs: breed.shortLegs, 
    hypoallergenic: breed.hypoallergenic,
    cfaUrl: breed.cfaUrl,
    vetstreetUrl: breed.vetstreetUrl,
    vcahospitalsUrl: breed.vcahospitalsUrl,
    wikipediaUrl: breed.wikipediaUrl
  );

  static String breedImageUrlFromBreedImageResponse(
    BreedImageResponse breedImages
  ) => breedImages.url;
}