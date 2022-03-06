import 'package:http/http.dart' as http;
import 'package:filme_app/secrets/url.dart' as serverUrl;

class QueryService {
  getUpcoming() async {
    var query = await http.get(serverUrl.upcomingQuery());
  }

  searchUpcoming(String search) {}
}
