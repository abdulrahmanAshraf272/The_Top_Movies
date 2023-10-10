import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YearAndGenre extends StatelessWidget {
  final int year;
  final String genre;
  const YearAndGenre({super.key, required this.year, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$year',
          style:
              TextStyle(fontSize: 13.sp, color: Colors.white.withOpacity(0.9)),
        ),
        SizedBox(
          width: 5.w,
        ),
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.white.withOpacity(0.9)),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          genre,
          style:
              TextStyle(fontSize: 13.sp, color: Colors.white.withOpacity(0.9)),
        ),
      ],
    );
  }
}
