import 'package:filme_app/models/movie.model.dart';
import 'package:filme_app/models/movie_list.model.dart';
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
}
