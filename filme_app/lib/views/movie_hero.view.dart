import 'package:filme_app/controllers/movie.controller.dart';
import 'package:filme_app/models/movie.model.dart';
import 'package:filme_app/services/date_formatter.dart';
import 'package:filme_app/services/url.dart';
import 'package:flutter/material.dart';

class MovieHeroView extends StatelessWidget {
  MovieHeroView({Key? key, required this.movie}) : super(key: key);

  MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title! + " (${dateTimeStringFormattedYear(movie.releaseDate)})",
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.network(
              Url().imageSearch(movie.backdropPath!),
              // height: 300,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 180,
            right: 5,
            left: 5,
            child: Row(
              children: [
                Hero(
                  tag: 'movie',
                  child: Image.network(
                    Url().imageSearch(movie.posterPath!),
                    height: 200,
                  ),
                ),
                const VerticalDivider(
                  width: 10,
                ),
                SizedBox(
                  width: 230,
                  child: Text(
                    movie.overview!,
                    maxLines: 10,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 50,
            right: 50,
            top: 500,
            child: SizedBox(
              width: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Genres",
                        style: TextStyle(fontSize: 22),
                      ),
                      // Text(movie.genresConcat!),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.star, size: 40),
                      Text(
                        "n.a.",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        " / 10",
                        style: TextStyle(fontSize: 18, color: Colors.white60),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
