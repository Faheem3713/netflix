class Trending {
  Trending({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
  });

  int id;
  String title;

  String overview;
  String posterPath;

  DateTime releaseDate;

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "overview": overview,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
      };
}
