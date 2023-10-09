import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: screenHeight * 0.21,
              width: 123.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/movie_image_demo.png',
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 6),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Sonic\n',
                style: TextStyle(
                    fontSize: 14.sp, color: Colors.white.withOpacity(0.9)),
              ),
              TextSpan(
                text: '2023',
                style: TextStyle(
                    fontSize: 10.sp, color: Colors.white.withOpacity(0.5)),
              )
            ])),
          )
        ],
      ),
    );
  }
}
