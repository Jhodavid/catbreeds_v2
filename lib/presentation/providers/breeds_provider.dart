import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:catbreeds/domain/entities/breed_entity.dart';
import 'package:catbreeds/domain/utils/request_status_enum.dart';

import 'package:catbreeds/infrastructure/datasources/catbreeds_api_datasource.dart';
import 'package:catbreeds/infrastructure/repositories/catbreeds_repository_impl.dart';



final breedsProvider = StateNotifierProvider<BreedsNotifier, BreedsState>((ref) {
  final catbreedsRepository = CatbreedsRepositoryImpl(CatbreedsApiDatasource());

  return BreedsNotifier(
    catbreedsRepository: catbreedsRepository
  );
});

class BreedsNotifier extends StateNotifier<BreedsState> {

  final CatbreedsRepositoryImpl catbreedsRepository;

  BreedsNotifier({
    required this.catbreedsRepository
  }): super(const BreedsState()) {
    getCatsBreeds();
  }

  void getCatsBreeds() {
    state = state.copyWith(
      breedsLoadingStatus: RequestStatusEnum.isLoading
    );

    catbreedsRepository.getBreeds().then((value) {
      state = state.copyWith(
        breedsLoadingStatus: RequestStatusEnum.complete,
        catsBreedsList: value,
        filterCatsBreedsList: value
      );

      _getCatsBreedsImagesUrls();
    }).onError((error, stackTrace) {
      state = state.copyWith(
        breedsLoadingStatus: RequestStatusEnum.error
      );
    });
  }

  void _getCatsBreedsImagesUrls() async {
    final auxCatsBreedsState = List<BreedEntity>.from(state.catsBreedsList);

    for(var i=0; i<state.catsBreedsList.length; i++) {
      try {
        final catBreedImagesUrls = await catbreedsRepository.getBreedImages(state.catsBreedsList[i].id);

        auxCatsBreedsState[i] = auxCatsBreedsState[i].copyWith(
          imagesUrls: catBreedImagesUrls,
          imagesRequestStatus: RequestStatusEnum.complete
        );
      } catch(e) {
        auxCatsBreedsState[i] = auxCatsBreedsState[i].copyWith(
          imagesRequestStatus: RequestStatusEnum.error
        );
      }
    }

    state = state.copyWith(
      catsBreedsList: auxCatsBreedsState
    );
  }
}

class BreedsState {

  final RequestStatusEnum breedsLoadingStatus;
  final List<BreedEntity> catsBreedsList;

  const BreedsState({
    this.breedsLoadingStatus = RequestStatusEnum.none,
    this.catsBreedsList = const []
  });

  BreedsState copyWith({
    RequestStatusEnum? breedsLoadingStatus,
    List<BreedEntity>? catsBreedsList,
    List<BreedEntity>? filterCatsBreedsList
  }) => BreedsState(
    breedsLoadingStatus: breedsLoadingStatus ?? this.breedsLoadingStatus,
    catsBreedsList: catsBreedsList ?? this.catsBreedsList
  );
}