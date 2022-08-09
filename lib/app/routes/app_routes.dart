import 'package:app_studies/app/app_controller.dart';
import 'package:app_studies/app/app_unknow_view.dart';
import 'package:app_studies/app/routes/routes.dart';
import 'package:app_studies/presenters/first_screen/ui/first_screen.dart';
import 'package:app_studies/presenters/second_screen/ui/second_screen.dart';
import 'package:app_studies/presenters/pokemon/ui/pokemon_view.dart';

import 'package:flutter/material.dart';

Widget initialPage(RouteSettings routeSettings, AppController controller) {
  Widget initialPage = const HomeView();

  // if (controller.isLoggedIn) {
  //   if (!controller.hasNamedSaved) {
  //     initialPage = const SocialNameView();
  //   }
  // } else {
  //   final isFromLogin = routeSettings.arguments != null;
  //   initialPage = LanguageView(controller: controller, fromLogin: isFromLogin);
  // }
  return initialPage;
}

Widget getPage(RouteSettings routeSettings, AppController controller) {
  switch (routeSettings.name) {
    case '/':
      return initialPage(routeSettings, controller);
    case HomeView.routeName:
      return const HomeView();
    case FirstScreen.routeName:
      return const FirstScreen();
    case SecondScreen.routeName:
      return const SecondScreen();
    case PokemonView.routeName:
      return const PokemonView();

    default:
      return const AppUnknowView();
  }
}

Route<dynamic> routes(RouteSettings routeSettings, AppController controller) {
  Widget page = getPage(routeSettings, controller);
  // switch (routeSettings.name) {
  // case FriendlyFeedbackSelectEmail.routeName:
  // case ThermometerView.routeName:
  // case HolyHolidaysView.routeName:
  //   return SlideRoute(widget: page, settings: routeSettings);
  // default:
  return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) {
        return page;
      });
  // }
}
