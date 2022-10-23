import 'package:flutter/material.dart';
import 'package:pokedexapp/view/home_page.dart';

class RouterGenerator {
  static generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MyHomePage());
    }
  }
}
