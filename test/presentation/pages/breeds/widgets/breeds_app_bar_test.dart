import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


import 'package:catbreeds/config/localization/app_localization.dart';
import 'package:catbreeds/presentation/pages/breeds/widgets/breeds_app_bar.dart';



Widget createBreedsAppBarWidget() => MaterialApp(
  supportedLocales: AppLocalizations.supportedLocales,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  home: Scaffold(
    body: BreedsAppBar(
      searchTextValue: '',
      onChangeSearch: (_) { }
    ),
  ),
);

void main() {
  testWidgets('TestFormField handling', (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(createBreedsAppBarWidget());

    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.text('Texto de prueba'), findsNothing);

    await widgetTester.enterText(find.byType(TextFormField), 'Texto de prueba');
    await widgetTester.pump();

    expect(find.text('Texto de prueba'), findsOneWidget);
  });
}