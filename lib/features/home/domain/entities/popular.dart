import 'package:equatable/equatable.dart';

class Popular extends Equatable{
  final int? id;
  final String? name;
  final String? profilePath;

  const Popular({
    this.id,
    this.name,
    this.profilePath,
  });



  @override
  List<Object?> get props => [id, name, profilePath];

}