import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_top_movies/constants/my_colors.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/light_decoration.dart';
import 'package:the_top_movies/presentation_layer/widgets/arrow_back.dart';
import 'package:the_top_movies/presentation_layer/widgets/top_title_header.dart';

class CategorySelected extends StatelessWidget {
  const CategorySelected({super.key});

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
          Positioned.fill(child: Body()),
          Positioned(bottom: 15, right: 15, child: RandomButton())
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Column(
      children: [
        ArrowBack(),
        TopTextHeader(
          text: 'Top 50 Comedy Movies',
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return MovieItem();
                }),
          ),
        ),
      ],
    ));
  }
}

class RandomButton extends StatelessWidget {
  const RandomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.25,
              width: screenWidth / 2 - 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/movie_image_demo.png',
                      ),
                      fit: BoxFit.cover)),
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
      ),
    );
  }
}
