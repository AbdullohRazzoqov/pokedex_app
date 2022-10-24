import 'package:flutter/material.dart';
import 'package:pokedexapp/routers.dart';
void main() {
  runApp(const MyApp());
}
//camand

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.fallback(useMaterial3: false),
      initialRoute: '/',
      onGenerateRoute: (settings) => RouterGenerator.generateRoute(settings),
    );
  }
}
