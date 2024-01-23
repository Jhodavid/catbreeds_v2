import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


import 'package:catbreeds/domain/entities/breed_entity.dart';
import 'package:catbreeds/domain/utils/request_status_enum.dart';
import 'package:catbreeds/config/localization/app_localization.dart';

import 'package:catbreeds/presentation/pages/breeds/widgets/breed_card.dart';



Widget createBreedCardWidget(BreedEntity breed) => MaterialApp(
  supportedLocales: AppLocalizations.supportedLocales,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  home: BreedCard(breed: breed),
);

void main() {
  testWidgets('Displays all information', (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(createBreedCardWidget(selectedBreed));
    await widgetTester.pumpAndSettle();

    expect(find.text(selectedBreed.name), findsOneWidget);

    final BuildContext context = widgetTester.element(find.byType(BreedCard));
    expect(find.byTooltip(context.breedsIntelligenceTooltipMessage(selectedBreed.intelligence)), findsOneWidget);

    final progressIndicator = find.byType(CircularProgressIndicator).evaluate().first.widget as CircularProgressIndicator;
    expect(progressIndicator.value, selectedBreed.intelligence*0.2);
  });
}

final selectedBreed = BreedEntity(
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
);