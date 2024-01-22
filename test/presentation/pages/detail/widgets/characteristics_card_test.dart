
import 'package:catbreeds/config/localization/app_localization.dart';
import 'package:catbreeds/domain/entities/breed_entity.dart';
import 'package:catbreeds/domain/utils/request_status_enum.dart';
import 'package:catbreeds/presentation/pages/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


Widget createCharacteristicsWidget(BreedEntity breed) => MaterialApp(
  supportedLocales: AppLocalizations.supportedLocales,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  home: DetailPage(breed: breed),
);


void main() {
  group('Characteristics cat breed widget test', () {
    testWidgets('Test if page have the breed information', (widgetTester) async {
      await widgetTester.pumpWidget(createCharacteristicsWidget(selectedBreed));
      await widgetTester.pumpAndSettle();
      expect(find.byKey(const Key('adaptability')), findsOneWidget);
      expect(find.byKey(const Key('affectionLevel')), findsOneWidget);
      expect(find.byKey(const Key('childFriendly')), findsOneWidget);
      expect(find.byKey(const Key('dogFriendly')), findsOneWidget);
      expect(find.byKey(const Key('energyLevel')), findsOneWidget);
      expect(find.byKey(const Key('grooming')), findsOneWidget);
      expect(find.byKey(const Key('healthIssues')), findsOneWidget);
      expect(find.byKey(const Key('intelligence')), findsOneWidget);
      expect(find.byKey(const Key('sheddingLevel')), findsOneWidget);
      expect(find.byKey(const Key('socialNeeds')), findsOneWidget);
      expect(find.byKey(const Key('strangerFriendly')), findsOneWidget);
      expect(find.byKey(const Key('vocalisation')), findsOneWidget);
      expect(find.byKey(const Key('experimental')), findsNothing);
      expect(find.byKey(const Key('hairless')), findsNothing);
      expect(find.byKey(const Key('natural')), findsOneWidget);
      expect(find.byKey(const Key('rare')), findsNothing);
      expect(find.byKey(const Key('rex')), findsNothing);
      expect(find.byKey(const Key('suppressedTail')), findsNothing);
      expect(find.byKey(const Key('shortLegs')), findsNothing);
      expect(find.byKey(const Key('hypoallergenic')), findsNothing);
    });
  });
}

final selectedBreed = BreedEntity(
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
);