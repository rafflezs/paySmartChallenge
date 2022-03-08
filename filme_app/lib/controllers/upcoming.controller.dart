import 'package:filme_app/models/movie.model.dart';
import 'package:filme_app/models/movie_list.model.dart';
import 'package:filme_app/services/query.service.dart';

class UpcomingController {
  int? page;
  String? search;

  List<MovieModel>? movies;

  fetchFirstMovies() async {
    movies = await QueryService().getUpcoming();
  }

  // void fetchMoreMovies() async {
  //   movieList = await QueryService().getUpcoming(page: page);
  // }

  // searchMovies() {
  //   return QueryService().searchUpcoming(search!);
  // }
}
