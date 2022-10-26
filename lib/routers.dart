import 'package:flutter/material.dart';
import 'package:pokedexapp/model/pokedex_model.dart';
import 'package:pokedexapp/view/bottom_nav_bar/bottom_home.dart';
import 'package:pokedexapp/view/info_page/info_page.dart';

class RouterGenerator {
  static generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const MyBottomNavBarHome());
      case 'infoPage':
        return MaterialPageRoute(
            builder: (context) => InfoPage(
                  brand: (args as Pokemon),
                ));
    }
  }
}
