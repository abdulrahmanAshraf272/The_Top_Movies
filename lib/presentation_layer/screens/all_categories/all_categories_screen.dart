import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_top_movies/business_logic_layer/cubit/movies_cubit.dart';
import 'package:the_top_movies/business_logic_layer/cubit/result_state.dart';
import 'package:the_top_movies/constants/my_colors.dart';
import 'package:the_top_movies/data_layer/models/movie.dart';
import 'package:the_top_movies/data_layer/models/network_exceptions.dart';
import 'package:the_top_movies/presentation_layer/widgets/arrow_back.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/category_title_and_seeAll.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/light_decoration.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/movie_item.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/search_feild.dart';
import 'package:the_top_movies/presentation_layer/widgets/top_title_header.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MovieCubit>(context).emitgetBestActoinMovies();
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
          Positioned.fill(child: Body())
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Movie> bestActionMovies = [];
  List<Movie> bestComedyMovies = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          RandomMovieButton(),
          TopTextHeader(
            text: 'What would you like to watch?',
          ),
          SearchFeild(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: BlocBuilder<MovieCubit, ResultState<dynamic>>(
                builder: (context, ResultState<dynamic> state) {
                  return state.when(idle: () {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }, loading: () {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }, success: (dynamic movies) {
                    bestActionMovies = movies['action'];
                    bestComedyMovies = movies['comedy'];
                    return Column(
                      children: [
                        CategoryTitleAndSeeAll(title: 'Action Movies'),
                        MoviesList(),
                        CategoryTitleAndSeeAll(title: 'Comedy Movies'),
                        MoviesList(),
                        CategoryTitleAndSeeAll(title: 'Action Movies'),
                        MoviesList(),
                      ],
                    );
                  }, error: (NetworkExceptions error) {
                    return Container();
                  });
                },
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
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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

class RandomMovieButton extends StatelessWidget {
  const RandomMovieButton({super.key});

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
            child: Image.asset(
              'assets/icons/rendom.png',
              width: 28,
            ),
          ),
        ),
      ),
    );
  }
}
