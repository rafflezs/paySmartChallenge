import 'package:filme_app/models/movie.model.dart';
import 'package:flutter/material.dart';

class MovieGridComponent extends StatelessWidget {
  final MovieModel movie;
  const MovieGridComponent({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [Image.network(movie.posterPath!)],
            ),
            Text(movie.title! + " (" + movie.releaseDate! + ")"),
          ],
        ),
      ),
    );
  }
}
