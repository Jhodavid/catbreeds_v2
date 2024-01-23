import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:catbreeds/config/localization/app_localization.dart';

import 'package:catbreeds/domain/utils/request_status_enum.dart';

import 'package:catbreeds/presentation/widgets/loading_message.dart';
import 'package:catbreeds/presentation/pages/breeds/breeds_page.dart';
import 'package:catbreeds/presentation/providers/breeds_provider.dart';
import 'package:catbreeds/presentation/widgets/network_error_message.dart';



Widget createBreedsPage() => const ProviderScope(
  overrides: [],
  child: MaterialApp(
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    home: BreedsPage(),
  ),
);


bool isLoadedEnv = false;

void main() {

  Future<void> initEnv() async {
    if(!isLoadedEnv) {
      await dotenv.load(fileName: '.env');
      isLoadedEnv = true;
    }
  }

  group('Breeds page test', () {
    testWidgets('Displays loading indicator when loading', (WidgetTester widgetTester) async {
      await initEnv();

      final container = ProviderContainer();
      container.read(breedsProvider.notifier).state = const BreedsState(
        breedsLoadingStatus: RequestStatusEnum.isLoading
      );

      await widgetTester.pumpWidget(createBreedsPage());

      expect(find.byType(LoadingBreedsMessage), findsOneWidget);
      addTearDown(container.dispose);
    });

    testWidgets('Displays error message', (WidgetTester widgetTester) async {
      await initEnv();

      final container = ProviderContainer();
      container.read(breedsProvider.notifier).state = const BreedsState(
        breedsLoadingStatus: RequestStatusEnum.error
      );

      await widgetTester.pumpWidget(createBreedsPage());
      await widgetTester.pump();

      expect(find.byType(NetworkErrorMessage), findsOneWidget);
      addTearDown(container.dispose);
    });

    testWidgets('Display Scaffold Widget', (widgetTester) async {
      await initEnv();

      final container = ProviderContainer();
      container.read(breedsProvider.notifier).state = const BreedsState(
        breedsLoadingStatus: RequestStatusEnum.complete
      );

      await widgetTester.pumpWidget(createBreedsPage());
      await widgetTester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      addTearDown(container.dispose);
    });
  });
}
