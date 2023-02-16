class Trending {
  Trending({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
  });

  int id;
  String title;
  String originalTitle;
  String overview;
  String posterPath;

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
      };
}
