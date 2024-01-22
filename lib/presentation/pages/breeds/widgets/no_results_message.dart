

import 'package:catbreeds/config/localization/app_localization.dart';
import 'package:flutter/material.dart';

class NoResultsMessage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: height*0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.info_rounded,
          ),
          const SizedBox(height: 5),
          Text(
            l10n.breeds_no_result,
            style: textStylesTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}