import 'package:filme_app/models/movie.model.dart';
import 'package:filme_app/services/url.dart';
import 'package:flutter/material.dart';

class MovieCardComponent extends StatelessWidget {
  final MovieModel movie;
  const MovieCardComponent({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Card(
      child: SizedBox(
        child: Column(
          children: [
            Text("Teste"),
            Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: [
                Image.network(
                  Url().imageSearch(movie.posterPath!),
                  fit: BoxFit.fill,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
