import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_top_movies/constants/my_colors.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/arrow_back.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/category_title_and_seeAll.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/light_decoration.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/movie_item.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/search_feild.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/top_title_header.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.black,
      body: Stack(
        children: [
          Positioned(
              top: -screenHeight * 0.3,
              left: -screenWidth * 0.65,
              child: DecorationLight(
                color: MyColors.green,
              )),
          Positioned(
              top: screenHeight * 0.2,
              right: -screenWidth * 0.75,
              child: DecorationLight(
                color: MyColors.pink,
              )),
          Positioned(
              bottom: -screenHeight * 0.33,
              left: -screenWidth * 0.65,
              child: DecorationLight(
                color: MyColors.green,
              )),
          Positioned.fill(child: Body())
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: [
          ArrowBack(),
          TopTextHeader(),
          SearchFeild(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  CategoryTitleAndSeeAll(title: 'Action Movies'),
                  MoviesList(screenHeight: screenHeight),
                  CategoryTitleAndSeeAll(title: 'Action Movies'),
                  MoviesList(screenHeight: screenHeight),
                  CategoryTitleAndSeeAll(title: 'Action Movies'),
                  MoviesList(screenHeight: screenHeight),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.26,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 20, right: 4),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: ((context, index) => MovieItem()),
      ),
    );
  }
}
