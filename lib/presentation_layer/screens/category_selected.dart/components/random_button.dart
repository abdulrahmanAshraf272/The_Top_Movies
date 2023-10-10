import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_top_movies/constants/my_colors.dart';

class RandomButton extends StatelessWidget {
  final Function() press;
  const RandomButton({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          Container(
            height: 63.w,
            width: 63.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 30, // Layer blur
                  color: MyColors.pink.withOpacity(0.4),
                  spreadRadius: 10,
                  // Transparent color for the blur
                ),
              ],
            ),
          ),
          Container(
            height: 63.w,
            width: 63.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.5),
                border: Border.all(color: MyColors.pink, width: 3)),
            child: Image.asset('assets/icons/rendom.png'),
          ),
        ],
      ),
    );
  }
}
