import 'dart:convert';

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
            Opacity(
              opacity: 0.3,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    color: MyColors.borderColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: []),
              ),
            )
          ],
        ),
      ),
    );
  }
}
