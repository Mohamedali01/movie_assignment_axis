import 'package:hive/hive.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/film.dart';

part 'film_model.g.dart';

@HiveType(typeId: 1)
class FilmModel extends Film {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? posterPath;

  const FilmModel({
    this.id,
    this.title,
    this.posterPath,
  }) : super(id: id, title: title, posterPath: posterPath);

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'poster_path': posterPath,
  };
}
