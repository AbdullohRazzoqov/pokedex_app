import 'package:flutter/material.dart';
import 'package:pokedexapp/core/components/color/my_colors.dart';
import 'package:pokedexapp/service/pokedex_service.dart';

class SearchBottomPage extends StatefulWidget {
  const SearchBottomPage({super.key});

  @override
  State<SearchBottomPage> createState() => _SearchBottomPageState();
}

class _SearchBottomPageState extends State<SearchBottomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.C_2E3353,
      body: Column(
        children: [
      
          Expanded(
            child: FutureBuilder(
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
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Center(
                            child: Container(
                          margin: const EdgeInsets.all(10),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: MyColors.C_353E65,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Image.network("${data[index].img}"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${data[index].name}"),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.01,
                                  ),
                                  Text("#${data[index].id}")
                                ],
                              ),
                              
                              Opacity(
                                opacity: 0.4,
                                child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
                                  width: MediaQuery.of(context).size.width * 0.15,
                                  height: MediaQuery.of(context).size.width * 0.055,
                                  decoration: BoxDecoration(
                                      color: MyColors.black,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(child: Text(data[index].type![0],style:const  TextStyle(color: MyColors.white),)),
                                ),
                              )
                            ],
                          ),
                        ));
                      },
                      itemCount: data!.length,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
