import 'package:flutter/material.dart';
import 'package:pokedexapp/core/components/color/my_colors.dart';
import 'package:pokedexapp/service/pokedex_service.dart';

class AlbumBottomPage extends StatefulWidget {
  const AlbumBottomPage({super.key});

  @override
  State<AlbumBottomPage> createState() => _AlbumBottomPageState();
}

class _AlbumBottomPageState extends State<AlbumBottomPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            return Scaffold(
              body: ListView.builder(
                itemBuilder: (context, index) {
                  var data = snap.data!.pokemon;
                  dynamic _isNull =
                      (data![index].type![1]) == null ? true : false;
                  debugPrint(" aaaaaaaaaaaaaaa $_isNull");
                  debugPrint("$index");

                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(15),
                    height: 150,
                    decoration: BoxDecoration(
                      color: MyColors.C_353E65,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "#${data[index].id}",
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.white),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.008,
                            ),
                            Text(
                              "${data[index].name}",
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 75,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                        child: Text(data[index].type![0])),
                                  ),
                                  Container(
                                    width: 75,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Center(
                                      child: Text(
                                        (_isNull
                                            ? data[index].type![0]
                                            : data[index].type![1]),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Image(
                          image: NetworkImage(
                            "${data[index].img}",
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: snap.data!.pokemon!.length,
              ),
            );
          }
        });
  }
}
