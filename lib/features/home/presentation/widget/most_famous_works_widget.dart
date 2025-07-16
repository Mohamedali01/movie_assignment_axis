import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_assignment_axis/core/theme/font_styles/font_styles.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/presentation/page/image_viewer_page.dart';

class MostFamousWorksWidget extends StatelessWidget {
  const MostFamousWorksWidget({super.key, required this.popular});

  final Popular popular;

  @override
  Widget build(BuildContext context) {
    return             Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              final film = popular.films?[index];

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
            itemCount: popular.films?.length ?? 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics()),
      ],
    );
  }
}
