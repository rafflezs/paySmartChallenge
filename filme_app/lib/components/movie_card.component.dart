import 'package:filme_app/models/movie.model.dart';
import 'package:filme_app/services/date_formatter.dart';
import 'package:filme_app/services/url.dart';
import 'package:filme_app/views/movie_hero.view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieCardComponent extends StatelessWidget {
  final MovieModel movie;
  const MovieCardComponent({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Card(
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => MovieHeroView(movie: movie)),
          ),
        ),
        child: Hero(
          tag: 'movie',
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            children: [
              Image.network(
                Url().imageSearch(movie.posterPath!),
                fit: BoxFit.fill,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                    width: _screenSize.width / 2,
                    // decoration: BoxDecoration(),
                    color: Colors.black.withOpacity(0.5),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: _createMovieText(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _createMovieText() {
    return Text(
        movie.title! + " (${dateTimeStringFormattedYear(movie.releaseDate)})",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold));
  }
}
