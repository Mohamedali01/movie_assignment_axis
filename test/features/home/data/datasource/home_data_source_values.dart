import 'package:movie_assignment_axis/core/networking/api_path.dart';

import '../../../../core/helper/value_class.dart';



final Map<String, dynamic> successPopularResponse = <String, dynamic>{
  "page": 1,
  'results': [
    {
      'id': 1,
      'name': 'Jason',
      'profile_path': '/jason.jpg',
      'known_for_department': 'Acting',
      'known_for': [],
    }
  ]
};


final Map<String, dynamic> failurePopularResponse = <String, dynamic>{
  "status_code": 7,
  "status_message": "Invalid API key: You must be granted a valid key.",
  "success": false
};

ValueClass popularValues = ValueClass(
  successfulResponse: successPopularResponse,
  failureResponse: failurePopularResponse,
  path: ApiPath.getPopulars,
);