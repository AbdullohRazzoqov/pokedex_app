import 'package:flutter/material.dart';
import 'package:pokedexapp/core/components/color/my_colors.dart';
import 'package:pokedexapp/model/pokedex_model.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key, required this.brand}) : super(key: key);
  final Pokemon brand;
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.C_2E3353,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: MyColors.white,
                ),
                (widget.brand.id)!.toInt() < 9
                    ? Text(
                        "#00${widget.brand.id}",
                        style: const TextStyle(
                            color: MyColors.white, fontSize: 20),
                      )
                    : Text("${widget.brand.id}"),
                Opacity(
                    opacity: 0.5,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          size: 30,
                        )))
              ],
            ),
            Image.network("${widget.brand.img}"),
            Text(
              "${widget.brand.name}",
              style: const TextStyle(fontSize: 30, color: MyColors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 80,
              height: 28,
              decoration: BoxDecoration(
                  border: Border.all(color: MyColors.borderColor, width: 1.5),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "🌱  ${widget.brand.type![0]}",
                  style: const TextStyle(color: MyColors.borderColor),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Avg Spawns   ",
                  style: TextStyle(fontSize: 17),
                ),
                Text("${widget.brand.avgSpawns}"),
                const SizedBox(
                  height: 50,
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.012,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black54,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.012,
                      width: ((MediaQuery.of(context).size.width *
                          0.45 *
                          widget.brand.avgSpawns!.toDouble() /
                          100)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyColors.borderColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Candy Count",
                  style: TextStyle(fontSize: 17),
                ),
                Text("${widget.brand.candyCount}"),
                const SizedBox(
                  height: 50,
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.012,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black54,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.012,
                      width: ((MediaQuery.of(context).size.width *
                          0.45 *
                          widget.brand.candyCount!.toDouble() /
                          100)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyColors.borderColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Egg                   ",
                  style: TextStyle(fontSize: 17),
                ),
                Text("${widget.brand.spawnChance! * 100}"),
                const SizedBox(
                  height: 50,
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.012,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black54,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.012,
                      width: ((MediaQuery.of(context).size.width *
                          0.45 *
                          (widget.brand.spawnChance! * 100) /
                          100)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyColors.borderColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Opacity(
              opacity: 0.3,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    color: MyColors.borderColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.brand.weight} (${widget.brand.spawnChance})",
                            style: const TextStyle(
                                color: MyColors.white, fontSize: 16),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Weight",
                              style: TextStyle(color: MyColors.white),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 1,
                        color: MyColors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.brand.height} (${(widget.brand.multipliers).toString().substring(1, 5)})",
                            style: const TextStyle(
                                color: MyColors.white, fontSize: 16),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Height",
                              style: TextStyle(color: MyColors.white),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
