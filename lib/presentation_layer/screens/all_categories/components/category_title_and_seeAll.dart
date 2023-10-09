import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_top_movies/presentation_layer/screens/category_selected.dart/category_selected_screen.dart';

class CategoryTitleAndSeeAll extends StatelessWidget {
  final String title;
  const CategoryTitleAndSeeAll({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16.sp, color: Colors.white.withOpacity(0.75)),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategorySelected()));
            },
            child: Text(
              'see all',
              style: TextStyle(
                  fontSize: 12.sp, color: Colors.white.withOpacity(0.60)),
            ), // Text to display on the button
          )
        ],
      ),
    );
  }
}
