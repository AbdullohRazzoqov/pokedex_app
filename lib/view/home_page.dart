import 'package:flutter/material.dart';
import 'package:pokedexapp/service/pokedex_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ServicePokedex.getPokedex(),
          builder: (context, snap) {
            if (!snap.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snap.hasError) {
              return const Center(
                child: Text("ERROR"),
              );
            } else {
              var data = snap.data!.pokemon;
              return ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                title: Text("${data![index].name}"),
                );
              });
            }
          }),
    );
  }
}
