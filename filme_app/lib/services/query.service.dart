import 'package:filme_app/models/movie_list.model.dart';
import 'package:http/http.dart' as http;
import 'package:filme_app/secrets/url.dart' as serverUrl;

class QueryService {
  Future<MovieListModel> getUpcoming() async {
    final response = await http.get(serverUrl.upcomingQuery());
    if (response.statusCode == 200) {
      print("1");
      print(response.body);
      return MovieListModel.fromJson(response.body);
    } else {
      throw Exception("Falha na requisição - não foi possível obter dados");
    }
  }

  Future<MovieListModel> searchUpcoming(String search) async {
    final request = await http.post(Uri.parse(serverUrl.baseUrl + search));
    if (request.statusCode == 200) {
      return MovieListModel.fromJson(request.body);
    } else {
      throw Exception("Falha na requisição - não foi possível buscar dados");
    }
  }
}
