import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_top_movies/constants/my_colors.dart';

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
              child: GreenLight(
                color: MyColors.green,
              )),
          Positioned(
              top: screenHeight * 0.2,
              right: -screenWidth * 0.75,
              child: GreenLight(
                color: MyColors.pink,
              )),
          Positioned(
              bottom: -screenHeight * 0.33,
              left: -screenWidth * 0.65,
              child: GreenLight(
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

class SearchFeild extends StatelessWidget {
  const SearchFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: Colors.white.withOpacity(0.5),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ))
          ],
        ));
  }
}

class TopTextHeader extends StatelessWidget {
  const TopTextHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 50, left: 50),
      child: AutoSizeText(
        'What would you like to watch?',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 33,
            color: Colors.white.withOpacity(0.85)),
      ),
    );
  }
}

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
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
    );
  }
}

class GreenLight extends StatelessWidget {
  final Color color;
  const GreenLight({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ClipOval(
      child: Container(
        width: screenWidth * 1.4,
        height: screenWidth * 1.4,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            colors: [
              color.withOpacity(0.5), // Color #09fbd3 with 50% opacity
              Colors.transparent, // Transparent color at the outer border
            ],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: screenWidth * 1.4, // Layer blur
              color: Colors.transparent, // Transparent color for the blur
            ),
          ],
        ),
      ),
    );
  }
}
