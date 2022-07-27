import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jjc/repository/analytics_repository.dart';
import 'package:jjc/router_generator.dart';
import 'package:jjc/stores/globalStore.dart';
import 'package:jjc/stores/userStore.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<UserStore>(UserStore());
  getIt.registerSingleton<GlobalStore>(GlobalStore());
  getIt.registerSingleton<AnalyticsService>(AnalyticsService());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    var analyticsService = GetIt.I.get<AnalyticsService>();

    return GlobalLoaderOverlay(
      child:  MaterialApp(
        localizationsDelegates:
            AppLocalizations.localizationsDelegates, // important
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Jiu Lib',
        locale: _locale,
        initialRoute: '/pre',
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorObservers: [
          analyticsService.getAnalyticsObserver(),
        ],
        theme: ThemeData.dark().copyWith(
            primaryColor: Colors.lightBlue,
            scaffoldBackgroundColor: Colors.white),
      ),
    );
  }
}





