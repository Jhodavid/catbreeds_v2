import 'package:catbreeds/config/localization/app_localization.dart';
import 'package:flutter/material.dart';


import 'package:catbreeds/domain/entities/breed_entity.dart';
import 'package:catbreeds/presentation/pages/detail/widgets/progresive_info_card.dart';



class CharacteristicsCard extends StatelessWidget {

  const CharacteristicsCard({
    super.key,
    required this.breed,
  });

  final BreedEntity breed;

  @override
  Widget build(BuildContext context) {

    final l10n = context.l10n;
    final textStylesTheme = Theme.of(context).textTheme;
    
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.detail_characteristics_title,
              style: textStylesTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor
              )
            ),
            const SizedBox(height: 5),
            ProgressiveInfo(keyName: 'adaptability', title: l10n.detail_characteristic_adaptability, value: breed.adaptability),
            ProgressiveInfo(keyName: 'affectionLevel', title: l10n.detail_characteristic_affection_level, value: breed.affectionLevel),
            ProgressiveInfo(keyName: 'childFriendly', title: l10n.detail_characteristic_child_friendly, value: breed.childFriendly),
            ProgressiveInfo(keyName: 'dogFriendly', title: l10n.detail_characteristic_dog_friendly, value: breed.dogFriendly),
            ProgressiveInfo(keyName: 'energyLevel', title: l10n.detail_characteristic_energy_level, value: breed.energyLevel),
            ProgressiveInfo(keyName: 'grooming', title: l10n.detail_characteristic_grooming, value: breed.grooming),
            ProgressiveInfo(keyName: 'healthIssues', title: l10n.detail_characteristic_health_issues, value: breed.healthIssues),
            ProgressiveInfo(keyName: 'intelligence', title: l10n.detail_characteristic_intelligence, value: breed.intelligence),
            ProgressiveInfo(keyName: 'sheddingLevel', title: l10n.detail_characteristic_shedding_level, value: breed.sheddingLevel),
            ProgressiveInfo(keyName: 'socialNeeds', title: l10n.detail_characteristic_social_needs, value: breed.socialNeeds),
            ProgressiveInfo(keyName: 'strangerFriendly', title: l10n.detail_characteristic_stranger_friendly, value: breed.strangerFriendly),
            ProgressiveInfo(keyName: 'vocalisation', title: l10n.detail_characteristic_vocalisation, value: breed.vocalisation),
            ProgressiveInfo(keyName: 'experimental', title: l10n.detail_characteristic_experimental, value: breed.experimental),
            ProgressiveInfo(keyName: 'hairless', title: l10n.detail_characteristic_hairless, value: breed.hairless),
            ProgressiveInfo(keyName: 'natural', title: l10n.detail_characteristic_natural, value: breed.natural),
            ProgressiveInfo(keyName: 'rare', title: l10n.detail_characteristic_rare, value: breed.rare),
            ProgressiveInfo(keyName: 'rex', title: l10n.detail_characteristic_rex, value: breed.rex),
            ProgressiveInfo(keyName: 'suppressedTail', title: l10n.detail_characteristic_suppressed_tail, value: breed.suppressedTail),
            ProgressiveInfo(keyName: 'shortLegs', title: l10n.detail_characteristic_short_legs, value: breed.shortLegs),
            ProgressiveInfo(keyName: 'hypoallergenic', title: l10n.detail_characteristic_hypoallergenic, value: breed.hypoallergenic)
          ],
        ),
      ),
    );
  }
}
