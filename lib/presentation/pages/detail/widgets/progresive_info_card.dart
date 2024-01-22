import 'package:flutter/material.dart';


import 'package:catbreeds/config/localization/app_localization.dart';



class ProgressiveInfo extends StatelessWidget {

  final String keyName;

  const ProgressiveInfo({
    super.key, 
    required this.keyName,
    required this.title,
    required this.value,
  });

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width - 50;
    final textStylesTheme = Theme.of(context).textTheme;

    if(value == 0) {
      return Container();
    }

    return Padding(
      key: Key(keyName),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width*0.5,
            child: Text(
              title,
              style: textStylesTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Tooltip(
            message: context.detailCharacteristicsTooltipMessage(value),
            child: SizedBox(
              height: 20,
              width: width*0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                  value: value*0.2,
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}

