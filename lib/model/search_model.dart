class SearchModel {
  SearchModel({
    required this.backdropPath,
    required this.posterPath,
    required this.title,
  });

  String backdropPath;

  String posterPath;

  String title;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        backdropPath: json["backdrop_path"] ?? '',
        posterPath: json["poster_path"] ?? '',
        title: json["title"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "poster_path": posterPath,
        "title": title,
      };
}
