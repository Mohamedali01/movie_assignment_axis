import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';

class PopularModel extends Popular {
  const PopularModel({
    super.id,
    super.name,
    super.profilePath,
  });

  factory PopularModel.fromJson(Map<String, dynamic> json) {
    return PopularModel(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'],
    );
  }

}
