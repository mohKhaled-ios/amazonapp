import 'package:amazonapp/common/widget/bottom_bar.dart';
import 'package:amazonapp/features/admain/screens/producte_screen.dart';
import 'package:amazonapp/features/auth/screens/auth_screen.dart';
import 'package:amazonapp/features/producte_details/screens/Producte_details.dart';
import 'package:amazonapp/features/search/screen/search_screen.dart';
import 'package:amazonapp/home/screen/category_deals.dart';
import 'package:amazonapp/home/screen/home_screen.dart';
import 'package:amazonapp/models/producte.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateroute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Authscreen.routename:
      return MaterialPageRoute(builder: (_) => Authscreen());
    case Homepage.routename:
      return MaterialPageRoute(builder: (_) => Homepage());
    case CategoryDeals.routename:
      var category = routeSettings.arguments as String;

      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryDeals(
                category: category,
              ));
    case Bottombar.routename:
      return MaterialPageRoute(builder: (_) => Bottombar());
    case ProducteScreen.routename:
      return MaterialPageRoute(builder: (_) => ProducteScreen());

    case seachscreen.routename:
      var searchqurey = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => seachscreen(
                searchqurey: searchqurey,
              ));
    case ProducteDetailsscreen.routename:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ProducteDetailsscreen(
                product: product,
              ));

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm'),
                ),
              ));
      ;
  }
}
