import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';


extension AppLocalization on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  String breedsIntelligenceTooltipMessage(int rate) {
    String text = l10n.breeds_intelligence_tooltip_message;
    text = text.replaceAll('[rate]', rate.toString());
    text = text.replaceAll('[total]', '5');
    return text;
  }

  String detailCharacteristicsTooltipMessage(int rate) {
    String text = l10n.detail_characteristics_tooltip_message;
    text = text.replaceAll('[rate]', rate.toString());
    text = text.replaceAll('[total]', '5');
    return text;
  }
}
