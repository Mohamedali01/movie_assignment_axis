import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_assignment_axis/core/theme/font_styles/font_styles.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/presentation/page/image_viewer_page.dart';
import 'package:movie_assignment_axis/features/home/presentation/widget/department_widget.dart';
import 'package:movie_assignment_axis/features/home/presentation/widget/most_famous_works_widget.dart';

class PopularDetailsPage extends StatefulWidget {
  const PopularDetailsPage({super.key, required this.popular});

  static const String name = "/popular_details_page";
  final Popular popular;

  @override
  State<PopularDetailsPage> createState() => _PopularDetailsPageState();
}

class _PopularDetailsPageState extends State<PopularDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.popular.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              key: const Key('popular_image'),
             onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (_) => ImageViewerFromUrlScreen(
                     imageUrl:"https://image.tmdb.org/t/p/w500/${widget.popular.profilePath}",
                   ),
                 ),
               );

             },
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/w500/${widget.popular.profilePath}",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            DepartmentWidget(
              popular: widget.popular,
            ),

            MostFamousWorksWidget(
            popular: widget.popular,
            ),
          ],
        ),
      ),
    );
  }
}
