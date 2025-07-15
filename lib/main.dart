import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_assignment_axis/core/dependency_injection.dart';
import 'package:movie_assignment_axis/core/routes/routes.dart';
import 'package:movie_assignment_axis/core/theme/apptheme.dart';
import 'package:movie_assignment_axis/features/home/presentation/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
       return GetMaterialApp(
         debugShowCheckedModeBanner: false,
         theme: AppTheme.generate(

         ),
         getPages: Routes.pages,
         initialRoute: HomePage.name,
       );
      },
    );
  }
}
/*
API Read Access Token
eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNTk2ZmY1OWE3NGY4ZTEyZGFmNmVjMmQyOGE4MGFkYSIsIm5iZiI6MTc1MjU3NjY5Ny4wNTIsInN1YiI6IjY4NzYzMmI5M2U5MGIxN2IwZTdjNTM2ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gp2swKrMNYl45iv8U7Bx9yRNFdnqmh08eruQcMhIzX4



API Key
1596ff59a74f8e12daf6ec2d28a80ada


https://image.tmdb.org/t/p/w500/8KSDI7ijEv7QVZdIyrLw5Gnhhr8.jpg
 */