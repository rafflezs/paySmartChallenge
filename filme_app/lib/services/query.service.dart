import 'package:filme_app/models/genre.model.dart';
import 'package:filme_app/models/movie.model.dart';
import 'package:http/http.dart' as http;
import 'package:filme_app/services/url.dart';
import 'dart:convert';

class QueryService {
  Future<List<MovieModel>> getUpcoming({int? page}) async {
    List<MovieModel> movieList = [];
    final response = await http.get(Url().upcomingQuery(page: page));
    if (response.statusCode == 200) {
      final result = json.decode(response.body)["results"];

      result.forEach((e) {
        movieList.add(MovieModel.fromMap(e));
      });
      fetchGenresOfMovie(movieList);
      return movieList;
    } else {
      throw Exception("Falha na requisição - não foi possível obter dados");
    }
  }

  Future<List<MovieModel>> searchUpcoming(String search) async {
    List<MovieModel> movieList = [];
    final request = await http.post(Url().searchQuery(search));
    if (request.statusCode == 200) {
      final result = json.decode(request.body)["results"];

      result.forEach((e) {
        movieList.add(MovieModel.fromMap(e));
      });
      return movieList;
    } else {
      throw Exception("Falha na requisição - não foi possível obter dados");
    }
  }

  fetchGenresOfMovie(List<MovieModel> movies) async {
    List<GenreModel> _list = [];

    final response = await http.get(Url().getMovieGenres());

    if (response.statusCode == 200) {
      final result = json.decode(response.body)["genres"];

      result.forEach((e) {
        _list.add(GenreModel.fromMap(e));
      });

      // Que deus me perdoe por isso
      for (var element in movies) {
        for (var element2 in element.genres!) {
          for (var element3 in _list) {
            if (element3.id == element2.id) {
              element2 = element3;
              element.genresConcat =
                  (element.genresConcat! + element3.name! + " ");
            }
          }
        }
      }
    } else {
      throw Exception("Falha na requisição - não foi possível obter dados");
    }
  }
}
