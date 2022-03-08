import 'package:filme_app/secrets/api_key.dart';

class Url {
  // Since the test asks for movies and movies onyly
  String baseUrl = "https://api.themoviedb.org/3/";

  baseQuery() {
    return Uri.parse(baseUrl);
  }

  upcomingQuery({int? page}) {
    if (page == null)
      return Uri.parse(
          baseUrl + "movie/upcoming?api_key=${API_KEY}&language=en-US&");
    return Uri.parse(baseUrl +
        "movie/upcoming?api_key=${API_KEY}&language=en-US&page=${page}");
  }

  searchQuery(String search) {
    return Uri.parse(
        baseUrl + "search/movie?api_key=${API_KEY}&query=${search}");
  }

  imageSearch(String imgPath) {
    return "https://image.tmdb.org/t/p/original/${imgPath}";
  }
}
