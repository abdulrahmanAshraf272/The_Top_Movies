import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data_layer/models/movie.dart';

import 'components/movie_name.dart';
import 'components/rate.dart';
import 'components/year_and_genre.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: screenHeight * 0.5,
            width: screenWidth,
            decoration: BoxDecoration(),
            child: Hero(
              tag: 'movie_image${movie.id}',
              child: Image.network(
                movie.largeCoverImage!,
                fit: BoxFit.cover,
                height: screenHeight * 0.5,
                width: screenWidth,
              ),
            ),
          ),
          Container(
            width: screenWidth,
            height: screenHeight * 0.5,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, -4),
                    spreadRadius: 20,
                    blurRadius: 30,
                    color: Colors.black)
              ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Color(0xff19191B)],
              ),
            ),
            child: Column(
              children: [
                MovieName(name: movie.title!),
                YearAndGenre(
                  year: movie.year!,
                  genre: movie.genres!,
                ),
                // space(),
                // LikesNumber(
                //   likesNumber: 1233,
                // ),
                space(),
                Rate(
                  rate: movie.rating!,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AutoSizeText(
                    '${movie.summary}',
                    textAlign: TextAlign.center,
                    minFontSize: 10,
                    maxLines: 13,
                    style: TextStyle(
                        fontSize: 13.sp, color: Colors.white.withOpacity(0.75)),
                  ),
                ),
                // SizedBox(
                //   height: 24.h,
                // ),
                // customDivider(screenWidth),
                // space(),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 20),
                //     child: Text(
                //       'Casts',
                //       style: TextStyle(
                //           fontSize: 20.sp,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // GridView.builder(
                //     itemCount: 6,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       childAspectRatio: 2.5,
                //       crossAxisSpacing: 0,
                //       mainAxisSpacing: 0,
                //     ),
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     padding: EdgeInsets.zero,
                //     itemBuilder: (context, index) {
                //       return CastItem();
                //     })
              ],
            ),
          )
        ]),
      ),
    );
  }

  SizedBox space() {
    return SizedBox(
      height: 8.h,
    );
  }

  Container customDivider(double screenWidth) {
    return Container(
      width: screenWidth - 40,
      height: 2,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}

class CastItem extends StatelessWidget {
  const CastItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50.w,
          width: 110.w,
          padding: EdgeInsets.only(left: 35.w, top: 10, bottom: 8, right: 8),
          margin: EdgeInsets.only(left: 30.w, top: 5),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.20),
              border: Border.all(
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Colors.white.withOpacity(0.25),
                  width: 2),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(22),
                  bottomRight: Radius.circular(22))),
          child: AutoSizeText(
            'Angelina Jolie',
            maxLines: 2,
            style: TextStyle(fontSize: 14.sp, color: Colors.white),
          ),
        ),
        Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/actor_image.png',
                  ),
                  fit: BoxFit.fitWidth),
              border: Border.all(color: Color(0xff19191B), width: 4.5)),
        ),
      ],
    );
  }
}
