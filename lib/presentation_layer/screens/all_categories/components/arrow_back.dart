import 'package:flutter/material.dart';
import 'package:the_top_movies/constants/my_colors.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 46,
          width: 46,
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            border: Border.all(
              color: MyColors.green.withOpacity(0.5), // Stroke color
              width: 3, // Stroke width
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 40, // Blur radius
                color: Colors.transparent, // Transparent color for the blur
              ),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
