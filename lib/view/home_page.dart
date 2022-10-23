import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedexapp/core/components/color/my_colors.dart';
import 'package:pokedexapp/service/pokedex_service.dart';

//!cached_network_images => plugins bo'lib internetdan kelgan imagesni cashda saqlaydi keyingi safar keshdan olib ishlatadi qayta internetga murojat qilmaydi
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: MyColors.C_2E3353,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.04,
                top: MediaQuery.of(context).size.height * 0.04,
              ),
              child: const ListTile(
                leading: CircleAvatar(radius: 25),
                title: Text(
                  "Razzoqov Shohjahon",
                  style: TextStyle(
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.location_disabled,
                  color: MyColors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pokedex",
                  style: TextStyle(
                      color: MyColors.C_F7BB17,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: MyColors.C_F7BB17,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.search),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            const Text(
              "Near You",
              style: TextStyle(fontSize: 25, color: MyColors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Row(
              children: const [
                Text("asdf"),
                SizedBox(
                  width: 50,
                ),
                Text("asdf"),
                SizedBox(
                  width: 50,
                ),
                Text("asdf"),
                SizedBox(
                  width: 50,
                ),
                Text("asdf"),
              ],
            ),
            FutureBuilder(
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
                  return SizedBox(
                    height: 300,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 380,
                            width: 240,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 220,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    color: MyColors.C_353E65,
                                    borderRadius:
                                        BorderRadius.circular(30),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image(
                                    image: NetworkImage(
                                      data[index].img.toString(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: data!.length,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
