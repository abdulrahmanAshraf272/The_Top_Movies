import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YearAndGenre extends StatelessWidget {
  final int year;
  final List<String> genre;
  const YearAndGenre({super.key, required this.year, required this.genre});

  @override
  Widget build(BuildContext context) {
    String concatenatedString = genre.join('-');
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
        AutoSizeText(
          concatenatedString,
          style:
              TextStyle(fontSize: 13.sp, color: Colors.white.withOpacity(0.9)),
        ),
      ],
    );
  }
}
