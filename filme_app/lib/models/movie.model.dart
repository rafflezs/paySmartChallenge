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

  MovieModel(
      {this.title,
      this.posterPath,
      this.backdropPath,
      this.id,
      this.adult,
      this.releaseDate,
      this.overview,
      this.genres});

  MovieModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    adult = json['adult'];
    releaseDate = json['release_date'];
    overview = json['overview'];
    if (json['genres'] != null) {
      genres = <GenreModel>[];
      json['genres'].forEach((v) {
        genres!.add(new GenreModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['adult'] = this.adult;
    data['release_date'] = this.releaseDate;
    data['overview'] = this.overview;
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
