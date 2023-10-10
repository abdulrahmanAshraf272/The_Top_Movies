import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_top_movies/constants/my_colors.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/light_decoration.dart';

class RandomMovieScreen extends StatefulWidget {
  const RandomMovieScreen({super.key});

  @override
  State<RandomMovieScreen> createState() => _RandomMovieScreenState();
}

class _RandomMovieScreenState extends State<RandomMovieScreen> {
  //declare the isBack bool
  bool isBack = true;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

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
          Positioned.fill(
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Now we will start making our Card
                    //the principe is basic
                    //we will create a container that will display the back face or the front face
                    // and we will wrap it in a Transform widget
                    //then we will make a tween animation for animating our card
                    //now let's wrap our tween animation inside a gesture detector

                    GestureDetector(
                      onTap: _flip,
                      child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: angle),
                          duration: Duration(seconds: 1),
                          builder: (BuildContext context, double val, __) {
                            //here we will change the isBack val so we can change the content of the card
                            if (val >= (pi / 2)) {
                              isBack = false;
                            } else {
                              isBack = true;
                            }
                            return (Transform(
                              //let's make the card flip by it's center
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(val),
                              child: Container(
                                  width: 275.w,
                                  height: 380.h,
                                  child: isBack
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/back.png"),
                                            ),
                                          ),
                                        ) //if it's back we will display here
                                      : Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.identity()
                                            ..rotateY(
                                                pi), // it will flip horizontally the container
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/face.png"),
                                              ),
                                            ),
                                            child: Center(
                                              child: Container(
                                                width: 255.w,
                                                height: 365.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/large_cover.jpg'),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                          ),
                                        ) //else we will display it here,
                                  ),
                            ));
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
