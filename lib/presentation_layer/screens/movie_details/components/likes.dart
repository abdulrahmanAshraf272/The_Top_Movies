import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikesNumber extends StatelessWidget {
  final int likesNumber;
  const LikesNumber({super.key, required this.likesNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/like.svg',
          width: 11.w, // specify width
          height: 11.w,
          color: Colors.white.withOpacity(0.9), // specify height
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          '$likesNumber',
          style:
              TextStyle(fontSize: 11.sp, color: Colors.white.withOpacity(0.9)),
        ),
      ],
    );
  }
}
