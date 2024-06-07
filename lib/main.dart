import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:portofolio/utils/app_routes.dart';

class AppLocale  {
  static Locale locale = Locale('en');
}

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale locale = Locale('en');

  void setLocale(Locale newLocale) {
    setState(() {
      locale = newLocale;
    });
    print(locale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Pedro Guerra',
      theme: ThemeData.dark().copyWith(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.routes(this.setLocale),
      locale: locale,
    );
  }
}
