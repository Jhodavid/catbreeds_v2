import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import 'package:catbreeds/presentation/widgets/breeds_images_carousel.dart';

import 'package:catbreeds/presentation/pages/detail/widgets/urls_cards.dart';
import 'package:catbreeds/presentation/pages/detail/widgets/simple_info_card.dart';
import 'package:catbreeds/presentation/pages/detail/widgets/description_card.dart';
import 'package:catbreeds/presentation/pages/detail/widgets/characteristics_card.dart';

import 'package:catbreeds/domain/entities/breed_entity.dart';
import 'package:catbreeds/config/localization/app_localization.dart';



class DetailPage extends StatelessWidget {

  final BreedEntity breed;

  const DetailPage({
    super.key,
    required this.breed
  });

  @override
  Widget build(BuildContext context) {

    final l10n = context.l10n;
    final textStylesTheme = Theme.of(context).textTheme;

    final height = MediaQuery.of(context).size.height - (
      MediaQuery.of(context).padding.top +
      MediaQuery.of(context).padding.bottom +
      50
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: TextButton(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: Text(
          breed.name,
          style: textStylesTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BreedsImagesCarousel(
              height: height*0.4,
              width: MediaQuery.of(context).size.width-30,
              imagesUrls: breed.imagesUrls,
              status: breed.imagesRequestStatus,
              fit: BoxFit.cover,
            ),
            Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DescriptionCard(breed: breed),

                    SimpleInfoCard(title: l10n.detail_country_origin, value: breed.origin),
                    SimpleInfoCard(title: l10n.detail_lifetime, value: '${breed.lifeSpan} ${l10n.detail_years}'),
                    SimpleInfoCard(title: l10n.detail_weight, value: '${breed.weight} kg'),

                    CharacteristicsCard(breed: breed),

                    URLsCards(breed: breed),

                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}