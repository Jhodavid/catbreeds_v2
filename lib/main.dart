import 'package:flutter/material.dart';


import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:catbreeds/config/app_theme.dart';
import 'package:catbreeds/config/router/app_router.dart';
import 'package:catbreeds/config/localization/app_localization.dart';

import 'package:catbreeds/presentation/providers/breeds_provider.dart';



Future<void> main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends ConsumerWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    ref.watch(breedsProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: appRouter,
      theme: AppTheme(isDarkMode).getTheme(),
    );
  }
}