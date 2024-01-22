import 'package:catbreeds/config/localization/app_localization.dart';
import 'package:flutter/material.dart';



class LoadingBreedsMessage extends StatelessWidget {

  const LoadingBreedsMessage({super.key});

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: Image.asset('assets/searching_cat_breeds.gif')
          ),
          Text(
            l10n.breeds_search_cat_breeds,
            style: textStylesTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}