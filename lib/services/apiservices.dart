class ApiEndPoints {
  static const trendingApi =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=5fda37ebf34ddf1eff5108b47b582820";
  static const imageApi = "https://image.tmdb.org/t/p/original";
  static const popular =
      "https://api.themoviedb.org/3/movie/popular?api_key=5fda37ebf34ddf1eff5108b47b582820&language=en-US&page=1";
  static const topRated =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=5fda37ebf34ddf1eff5108b47b582820&language=en-US&page=1";
  static const createList =
      "https://api.themoviedb.org/3/list?api_key=5fda37ebf34ddf1eff5108b47b582820&session_id=d77f7c345f75b52ac8ba601b1e0a8b21af928086";
  static const getList =
      "https://api.themoviedb.org/3/account/%7Baccount_id%7D/lists?api_key=5fda37ebf34ddf1eff5108b47b582820&language=en-US&session_id=d77f7c345f75b52ac8ba601b1e0a8b21af928086&page=1";

  static String searchUrl(String name) =>
      "https://api.themoviedb.org/3/search/movie?api_key=5fda37ebf34ddf1eff5108b47b582820&language=en-US&query=$name&page=1&include_adult=false";

  static List videoUrls = [
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ];
}
