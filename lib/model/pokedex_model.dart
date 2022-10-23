class PokedexModel {
    PokedexModel({
        this.pokemon,
    });

    List<Pokemon>? pokemon;

    factory PokedexModel.fromJson(Map<String, dynamic> json) => PokedexModel(
        pokemon: List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
    );

  
}

class Pokemon {
    Pokemon({
        this.id,
        this.num,
        this.name,
        this.img,
        this.type,
        this.height,
        this.weight,
        this.candy,
        this.candyCount,
        this.egg,
        this.spawnChance,
        this.avgSpawns,
        this.spawnTime,
        this.multipliers,
        this.weaknesses,
        this.nextEvolution,
        this.prevEvolution,
    });

    int? id;
    String? num;
    String? name;
    String? img;
    List<String>? type;
    String? height;
    String? weight;
    String? candy;
    int? candyCount;
    String? egg;
    double? spawnChance;
    double? avgSpawns;
    String? spawnTime;
    List<double>? multipliers;
    List<String>? weaknesses;
    List<Evolution>? nextEvolution;
    List<Evolution>? prevEvolution;

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        type: List<String>.from(json["type"].map((x) => x)),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"] == null ? null : json["candy_count"],
        egg: json["egg"],
        spawnChance: json["spawn_chance"].toDouble(),
        avgSpawns: json["avg_spawns"].toDouble(),
        spawnTime: json["spawn_time"],
        multipliers: json["multipliers"] == null ? null : List<double>.from(json["multipliers"].map((x) => x.toDouble())),
        weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
        nextEvolution: json["next_evolution"] == null ? null : List<Evolution>.from(json["next_evolution"].map((x) => Evolution.fromJson(x))),
        prevEvolution: json["prev_evolution"] == null ? null : List<Evolution>.from(json["prev_evolution"].map((x) => Evolution.fromJson(x))),
    );

   
}

class Evolution {
    Evolution({
        this.num,
        this.name,
    });

    String? num;
    String? name;

    factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json["num"],
        name: json["name"],
    );

}
