import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:filme_app/models/movie.model.dart';

class MovieListModel {
  List<MovieModel> movies = [];
  MovieListModel({
    required this.movies,
  });

  MovieListModel copyWith({
    List<MovieModel>? movies,
  }) {
    return MovieListModel(
      movies: movies ?? this.movies,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'movies': movies.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieListModel.fromMap(Map<String, dynamic> map) {
    return MovieListModel(
      movies: List<MovieModel>.from(
          map['movies']?.map((x) => MovieModel.fromMap(x))),
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
