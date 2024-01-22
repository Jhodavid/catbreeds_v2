import 'package:catbreeds/presentation/widgets/network_error_message.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:catbreeds/config/localization/app_localization.dart';

import 'package:catbreeds/domain/entities/breed_entity.dart';
import 'package:catbreeds/domain/utils/request_status_enum.dart';

import 'package:catbreeds/presentation/widgets/loading_message.dart';
import 'package:catbreeds/presentation/pages/breeds/breeds_page.dart';
import 'package:catbreeds/presentation/providers/breeds_provider.dart';



Widget createBreedsPage() => const ProviderScope(
  overrides: [],
  child: MaterialApp(
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    home: BreedsPage(),
  ),
);


void main() {
  group('Breeds page test', () {
    testWidgets('Displays loading indicator when loading', (WidgetTester widgetTester) async {
      final container = ProviderContainer();
      container.read(breedsProvider.notifier).state = const BreedsState(breedsLoadingStatus: RequestStatusEnum.isLoading);

      await widgetTester.pumpWidget(createBreedsPage());

      expect(find.byType(LoadingBreedsMessage), findsOneWidget);
      addTearDown(container.dispose);
    });

    testWidgets('Displays error message', (WidgetTester widgetTester) async {
      final container = ProviderContainer();
      container.read(breedsProvider.notifier).state = const BreedsState(breedsLoadingStatus: RequestStatusEnum.error);

      await widgetTester.pumpWidget(createBreedsPage());

      expect(find.byType(NetworkErrorMessage), findsOneWidget);
      addTearDown(container.dispose);
    });

    testWidgets('Display all information', (widgetTester) async {
      final container = ProviderContainer();
      container.read(breedsProvider.notifier).state = BreedsState(
        breedsLoadingStatus: RequestStatusEnum.complete,
        catsBreedsList: breedsList
      );

      await widgetTester.pumpWidget(createBreedsPage());

      expect(find.text(breedsList[0].name), findsOneWidget);
      expect(find.text(breedsList[1].name), findsOneWidget);
      addTearDown(container.dispose);
    });

    testWidgets('Display filter information', (widgetTester) async {
      final container = ProviderContainer();
      container.read(breedsProvider.notifier).state = BreedsState(
        breedsLoadingStatus: RequestStatusEnum.complete,
        catsBreedsList: breedsList
      );

      await widgetTester.pumpWidget(createBreedsPage());
      await widgetTester.enterText(find.byType(TextFormField), 'aege');
      await widgetTester.pump();

      expect(find.text(breedsList[0].name), findsOneWidget);
      expect(find.text(breedsList[1].name), findsNothing);
      addTearDown(container.dispose);
    });
  });
}

final breedsList = <BreedEntity>[
  BreedEntity(
    id: 'aege',
    name: 'Aegean',
    weight: '3 - 5',
    origin: 'Greece',
    lifeSpan: '9 - 12',
    description: 'Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.',
    imagesUrls: const [],
    imagesRequestStatus: RequestStatusEnum.complete,
    adaptability: 5,
    affectionLevel: 5,
    childFriendly: 3,
    dogFriendly: 4,
    energyLevel: 5,
    grooming: 1,
    healthIssues: 2,
    intelligence: 5,
    sheddingLevel: 2,
    socialNeeds: 5,
    strangerFriendly: 5,
    vocalisation: 1,
    experimental: 0,
    hairless: 0,
    natural: 1,
    rare: 0,
    rex: 0,
    suppressedTail: 0,
    shortLegs: 0,
    hypoallergenic: 0,
    cfaUrl: null,
    vetstreetUrl: 'http://www.vetstreet.com/cats/aegean-cat',
    vcahospitalsUrl: null,
    wikipediaUrl: 'https://en.wikipedia.org/wiki/Aegean_cat'
  ),
  BreedEntity(
    id: 'abys',
    name: 'Abyssinian',
    weight: '3 - 5',
    origin: 'Egypt',
    lifeSpan: '14 - 15',
    description: 'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.',
    imagesUrls: const [],
    imagesRequestStatus: RequestStatusEnum.complete,
    adaptability: 5,
    affectionLevel: 5,
    childFriendly: 3,
    dogFriendly: 4,
    energyLevel: 5,
    grooming: 1,
    healthIssues: 2,
    intelligence: 5,
    sheddingLevel: 2,
    socialNeeds: 5,
    strangerFriendly: 5,
    vocalisation: 1,
    experimental: 0,
    hairless: 0,
    natural: 1,
    rare: 0,
    rex: 0,
    suppressedTail: 0,
    shortLegs: 0,
    hypoallergenic: 0,
    cfaUrl: 'http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx',
    vetstreetUrl: 'http://www.vetstreet.com/cats/abyssinian',
    vcahospitalsUrl: 'https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian',
    wikipediaUrl: 'https://en.wikipedia.org/wiki/Abyssinian_(cat)'
  )
];
