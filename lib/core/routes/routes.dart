import 'package:get/get.dart';
import 'package:movie_assignment_axis/features/home/presentation/page/home_page.dart';

class Routes {
  static List<GetPage> get pages => [
        GetPage(
          name: HomePage.name,
          page: () => const HomePage(),
        ),
      ];
}
