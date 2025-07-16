import 'package:hive/hive.dart';
import 'package:movie_assignment_axis/features/home/data/model/film_model.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';

part 'popular_model.g.dart';

@HiveType(typeId: 0)
class PopularModel extends Popular {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? profilePath;

  @HiveField(3)
  final String? knownDepartment;

  @HiveField(4)
  final List<FilmModel>? films;

  const PopularModel({
    this.id,
    this.name,
    this.profilePath,
    this.knownDepartment,
    this.films,
  }) : super(
    id: id,
    name: name,
    profilePath: profilePath,
    knownDepartment: knownDepartment,
    films: films,
  );

  factory PopularModel.fromJson(Map<String, dynamic> json) {
    return PopularModel(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'],
      knownDepartment: json['known_for_department'],
      films: (json['known_for'] as List?)
          ?.map((film) => FilmModel.fromJson(film as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'profile_path': profilePath,
    'known_for_department': knownDepartment,
    'known_for': films?.map((film) => film.toJson()).toList(),
  };
}
