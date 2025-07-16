import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_assignment_axis/core/theme/font_styles/font_styles.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/presentation/page/image_viewer_page.dart';

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Department",
                style: FontStyles.h1.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,

                ),
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                decoration: BoxDecoration(
                  // color: Colors.grey.shade200,
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  widget.popular.knownDepartment ?? '',
                  style: FontStyles.b1.copyWith(
                    color: Colors.white,
                    height: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,

                  ),
                ),
             ),
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Most Famous Works",
                style: FontStyles.h1.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.7),
                itemBuilder: (context, index) {
                  final film = widget.popular.films?[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ImageViewerFromUrlScreen(
                              imageUrl: "https://image.tmdb.org/t/p/w500/${film?.posterPath ?? ''}",
                            ),
                          ),
                        );

                      },
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://image.tmdb.org/t/p/w500/${film?.posterPath ?? ''}",
                        height: 200,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: widget.popular.films?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics()),
          ],
        ),
      ),
    );
  }
}
