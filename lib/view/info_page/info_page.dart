import 'package:flutter/material.dart';
import 'package:pokedexapp/service/pokedex_service.dart';

class InfoPage extends StatefulWidget {
   InfoPage({super.key,this.brand});
 List? brand;
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ServicePokedex.getPokedex(),
          builder: (context, snap) {
            if (!snap.hasData) {
              return const CircularProgressIndicator();
            } else if (snap.hasError) {
              return const Text("ERROR");
            } else {
              var data = snap.data!.pokemon;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back_ios)),
                        Text("#${data![0].id}")
                      ],
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
