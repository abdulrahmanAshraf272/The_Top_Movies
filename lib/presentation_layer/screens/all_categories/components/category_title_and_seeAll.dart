import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              // Add your button click logic here
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
