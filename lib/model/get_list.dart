class MyList {
  MyList({
    required this.description,
    required this.favoriteCount,
    required this.id,
    required this.itemCount,
    required this.iso6391,
    required this.listType,
    required this.name,
    this.posterPath,
  });

  String description;
  int favoriteCount;
  int id;
  int itemCount;
  String iso6391;
  String listType;
  String name;
  dynamic posterPath;

  factory MyList.fromJson(Map<String, dynamic> json) => MyList(
        description: json["description"],
        favoriteCount: json["favorite_count"],
        id: json["id"],
        itemCount: json["item_count"],
        iso6391: json["iso_639_1"],
        listType: json["list_type"],
        name: json["name"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "favorite_count": favoriteCount,
        "id": id,
        "item_count": itemCount,
        "iso_639_1": iso6391,
        "list_type": listType,
        "name": name,
        "poster_path": posterPath,
      };
}
