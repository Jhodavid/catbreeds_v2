import 'package:catbreeds/config/localization/app_localization.dart';
import 'package:catbreeds/config/router/app_routes.dart';
import 'package:catbreeds/presentation/widgets/breeds_images_carousel.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import 'package:catbreeds/domain/entities/breed_entity.dart';



class BreedCard extends StatelessWidget {

  final BreedEntity breed;

  const BreedCard({
    super.key,
    required this.breed
  });

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Theme.of(context).secondaryHeaderColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    breed.name,
                    style: textStylesTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  icon: const Icon( Icons.read_more_rounded),
                  label: Text(
                    l10n.breeds_read_more,
                    style: textStylesTheme.bodyMedium,
                  ),
                  onPressed: () => context.push(AppRoutesEnum.detail.path, extra: breed)
                )
              ],
            ),

            BreedsImagesCarousel(
              height: 240,
              width: MediaQuery.of(context).size.width-30,
              imagesUrls: breed.imagesUrls,
              status: breed.imagesRequestStatus,
              fit: BoxFit.fill,
            ),

            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      breed.origin,
                      style: textStylesTheme.titleSmall,
                    ),
                    const Spacer(),
                    Text(
                      l10n.breeds_intelligence,
                      style: textStylesTheme.titleSmall,
                    ),
                    const SizedBox(width: 10),
                    Tooltip(
                      message: context.breedsIntelligenceTooltipMessage(breed.intelligence),
                      child: Container(
                        height: 35,
                        width: 35,
                        padding: const EdgeInsets.all(7),
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          value: breed.intelligence*0.2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}