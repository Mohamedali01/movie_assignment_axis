import 'package:equatable/equatable.dart';

class Film extends Equatable{
  final int? id;
  final String? title;
  final String? posterPath;

  const Film({
    this.id,
    this.title,
    this.posterPath,
  });

  @override
  List<Object?> get props => [id, title, posterPath];

}