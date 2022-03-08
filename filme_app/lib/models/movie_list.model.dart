import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:filme_app/models/movie.model.dart';

class MovieListModel {
  List<MovieModel>? movies = [];
  MovieListModel(
    this.movies,
  );

  MovieListModel copyWith({
    List<MovieModel>? movies,
  }) {
    return MovieListModel(
      movies ?? this.movies,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'results': movies?.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieListModel.fromMap(Map<String, dynamic> map) {
    return MovieListModel(
      map[0] != null
          ? List<MovieModel>.from(map[0]?.map((x) => MovieModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieListModel.fromJson(String source) =>
      MovieListModel.fromMap(json.decode(source));

  @override
  String toString() => 'MovieListModel(movies: $movies)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieListModel && listEquals(other.movies, movies);
  }

  @override
  int get hashCode => movies.hashCode;
}
