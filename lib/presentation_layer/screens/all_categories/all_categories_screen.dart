import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../business_logic_layer/cubit/movies_cubit.dart';
import '../../../business_logic_layer/cubit/result_state.dart';
import '../../../constants/my_colors.dart';
import '../../../data_layer/models/movie.dart';
import '../../../data_layer/models/network_exceptions.dart';
import '../movie_details/movie_details_screen.dart';
import 'components/light_decoration.dart';
import '../random_movie/random_movie_screen.dart';
import '../../widgets/top_title_header.dart';

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
  final _searchTextController = TextEditingController();
  late List<Movie> searchedForMovies;
  late List<Movie> allMovies;

  bool isLoading = false;

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
    super.initState();
  }

  Widget _buildSearchField() {
    return Container(
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: TextField(
                    controller: _searchTextController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                    onChanged: (searchedMovie) {
                      addSearchedItemsToSearchedList(searchedMovie);
                    }))
          ],
        ));
  }

  void addSearchedItemsToSearchedList(String searchedMovie) {
    searchedForMovies = _movies
        .where((movie) => movie.title!.toLowerCase().startsWith(searchedMovie))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MovieCubit>(context)
        .emitgetBestMovies(categories[selectedIndex]);
    return SafeArea(
      child: Column(
        children: [
          const RandomMovieButton(),
          const TopTextHeader(
            text: 'What would you like to watch?',
          ),
          _buildSearchField(),
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
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    );
                  }, loading: () {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    );
                  }, success: (dynamic movies) {
                    _movies = movies;
                    return Column(
                      children: [
                        GridView.builder(
                            itemCount: _searchTextController.text.isEmpty
                                ? _movies.length
                                : searchedForMovies.length,
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
                                movie: _searchTextController.text.isEmpty
                                    ? _movies[index]
                                    : searchedForMovies[index],
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
