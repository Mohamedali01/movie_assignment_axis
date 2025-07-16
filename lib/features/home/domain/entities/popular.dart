import 'package:equatable/equatable.dart';
import 'package:movie_assignment_axis/features/home/data/model/film_model.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/film.dart';

class Popular extends Equatable{
  final int? id;
  final String? name;
  final String? profilePath;
  final String? knownDepartment;
  final List<FilmModel>? films;

  const Popular({
    this.id,
    this.name,
    this.profilePath,
    this.knownDepartment,
    this.films,
  });



  @override
  List<Object?> get props => [id, name, profilePath, knownDepartment, films];

}