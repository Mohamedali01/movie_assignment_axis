import 'package:flutter/material.dart';
import 'package:movie_assignment_axis/core/theme/font_styles/font_styles.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';

class DepartmentWidget extends StatelessWidget {
  const DepartmentWidget({super.key, required this.popular});

  final Popular popular;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              // color: Colors.grey.shade200,
              color: Colors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              popular.knownDepartment ?? '',
              style: FontStyles.b1.copyWith(
                color: Colors.white,
                height: 1,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
