import 'package:app_studies/app/app_controller.dart';
import 'package:app_studies/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AppController controller;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, Widget? child) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return MaterialApp(
            // navigatorObservers: [
            //   GetIt.I<AnalyticsFacade>().getAnalyticsObserver(),
            // ],
            restorationScopeId: 'app',
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            // locale: widget.controller.locale,
            // supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData.from(
              colorScheme: const ColorScheme.light(),
            ).copyWith(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              ),
            ),
            darkTheme: ThemeData.dark(),
            // themeMode: widget.controller.themeMode,
            onGenerateRoute: (RouteSettings routeSettings) =>
                routes(routeSettings, widget.controller));
      },
    );
  }
}
