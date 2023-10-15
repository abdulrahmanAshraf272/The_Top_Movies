import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_top_movies/business_logic_layer/cubit/movies_cubit.dart';
import 'package:the_top_movies/business_logic_layer/cubit/result_state.dart';
import 'package:the_top_movies/constants/my_colors.dart';
import 'package:the_top_movies/data_layer/models/movie.dart';
import 'package:the_top_movies/data_layer/models/network_exceptions.dart';
import 'package:the_top_movies/presentation_layer/screens/movie_details/movie_details_screen.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/light_decoration.dart';
import 'package:the_top_movies/presentation_layer/screens/all_categories/components/search_feild.dart';
import 'package:the_top_movies/presentation_layer/screens/random_movie/random_movie_screen.dart';
import 'package:the_top_movies/presentation_layer/widgets/top_title_header.dart';

List<Movie> _movies = [];

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
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
  int selectedIndex = 0;
  List<String> categories = [
    'all',
    'action',
    'comedy',
    'adventure',
    'animation',
    'biography',
    'crime',
    'drama',
    'family',
    'fantasy',
    'history',
    'horror',
    'mystery',
    'romance',
    'sci-fi',
    'sport',
    'thriller',
    'war',
    'western',
    'documentary'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MovieCubit>(context).emitgetBestMovies('');
  }

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
          SizedBox(
            height: 35,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(right: 20),
                itemCount: categories.length,
                itemBuilder: (context, index) => buildGenreItem(index)),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: BlocBuilder<MovieCubit, ResultState<dynamic>>(
                builder: (context, ResultState<dynamic> state) {
                  return state.when(idle: () {
                    print('idle state');
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    );
                  }, loading: () {
                    print('loading state');
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    );
                  }, success: (dynamic movies) {
                    print('hello world');
                    _movies = movies;
                    return Column(
                      children: [
                        GridView.builder(
                            itemCount: movies.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.68,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                            ),
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return MovieItem(
                                movie: _movies[index],
                              );
                            })
                      ],
                    );
                  }, error: (NetworkExceptions error) {
                    return Center(
                      child: Text(
                        NetworkExceptions.getErrorMessage(error),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    );
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildGenreItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          BlocProvider.of<MovieCubit>(context)
              .emitgetBestMovies(categories[index]);
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: selectedIndex == index
                ? MyColors.green.withOpacity(0.1)
                : Colors.transparent),
        child: Text(
          categories[index],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedIndex == index
                  ? MyColors.green.withOpacity(0.7)
                  : Colors.white.withOpacity(0.4)),
        ),
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(
                      movie: movie,
                    )));
      },
      child: Center(
        child: SizedBox(
          width: screenWidth / 2 - 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: screenHeight * 0.25,
                  //width: screenWidth / 2 - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: 'movie_image${movie.id}',
                      child: Container(
                          width: screenWidth / 2 - 40,
                          color: Colors.white.withOpacity(0.1),
                          child: movie.largeCoverImage != null
                              ? FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/loading2.gif',
                                  image: movie.largeCoverImage!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/noImageAvailable.jpg')),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 22, top: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${movie.title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white.withOpacity(0.9)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${movie.year}',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white.withOpacity(0.5)),
                      )
                    ],
                  ))
            ],
          ),
        ),
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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RandomMovieScreen(
                        movies: _movies!,
                      )));
        },
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
            boxShadow: const [
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

class Genres extends StatefulWidget {
  const Genres({super.key});

  @override
  State<Genres> createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  List<String> categories = [
    'all',
    'action',
    'comedy',
    'adventure',
    'animation',
    'biography',
    'crime',
    'drama',
    'family',
    'fantasy',
    'history',
    'horror',
    'mystery',
    'romance',
    'sci-fi',
    'sport',
    'thriller',
    'war',
    'western',
    'documentary'
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(right: 20),
          itemCount: categories.length,
          itemBuilder: (context, index) => buildGenreItem(index)),
    );
  }

  Widget buildGenreItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          BlocProvider.of<MovieCubit>(context)
              .emitgetBestMovies(categories[index]);
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: selectedIndex == index
                ? MyColors.green.withOpacity(0.1)
                : Colors.transparent),
        child: Text(
          categories[index],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedIndex == index
                  ? MyColors.green.withOpacity(0.7)
                  : Colors.white.withOpacity(0.4)),
        ),
      ),
    );
  }
}
