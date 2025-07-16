import 'package:get/get.dart';
import 'package:movie_assignment_axis/features/home/presentation/page/home_page.dart';
import 'package:movie_assignment_axis/features/home/presentation/page/popular_details_page.dart';

class Routes {
  static List<GetPage> get pages => [
        GetPage(
          name: HomePage.name,
          page: () => const HomePage(),
        ),
        GetPage(
          name: PopularDetailsPage.name,
          page: () => PopularDetailsPage(
            popular: Get.arguments,
          ),
        ),
      ];
}
