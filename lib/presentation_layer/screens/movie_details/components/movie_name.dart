import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieName extends StatelessWidget {
  final String name;
  const MovieName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: AutoSizeText(
        name,
        maxLines: 1,
        style: TextStyle(
            fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
