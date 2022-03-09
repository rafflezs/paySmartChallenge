import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:filme_app/models/genre.model.dart';

class MovieModel {
  String? title;
  String? posterPath;
  String? backdropPath;
  int? id;
  bool? adult;
  String? releaseDate;
  String? overview;
  List<GenreModel>? genres;

  String? genresConcat;

  MovieModel({
    this.title,
    this.posterPath,
    this.backdropPath,
    this.id,
    this.adult,
    this.releaseDate,
    this.overview,
    this.genres,
  });

  MovieModel copyWith({
    String? title,
    String? posterPath,
    String? backdropPath,
    int? id,
    bool? adult,
    String? releaseDate,
    String? overview,
    List<GenreModel>? genres,
  }) {
    return MovieModel(
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      id: id ?? this.id,
      adult: adult ?? this.adult,
      releaseDate: releaseDate ?? this.releaseDate,
      overview: overview ?? this.overview,
      genres: genres ?? this.genres,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
      'id': id,
      'adult': adult,
      'release_date': releaseDate,
      'overview': overview,
      'genres': genres?.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['title'],
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
      id: map['id']?.toInt(),
      adult: map['adult'],
      releaseDate: map['release_date'],
      overview: map['overview'],
      genres: map['genres_id'] != null
          ? List<GenreModel>.from(
              map['genres']?.map((x) => GenreModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieModel(title: $title, posterPath: $posterPath, backdropPath: $backdropPath, id: $id, adult: $adult, releaseDate: $releaseDate, overview: $overview, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel &&
        other.title == title &&
        other.posterPath == posterPath &&
        other.backdropPath == backdropPath &&
        other.id == id &&
        other.adult == adult &&
        other.releaseDate == releaseDate &&
        other.overview == overview &&
        listEquals(other.genres, genres);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        posterPath.hashCode ^
        backdropPath.hashCode ^
        id.hashCode ^
        adult.hashCode ^
        releaseDate.hashCode ^
        overview.hashCode ^
        genres.hashCode;
  }
}
