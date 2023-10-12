import 'package:dio/dio.dart';
import 'package:the_top_movies/data_layer/models/api_response.dart';
import 'package:the_top_movies/data_layer/models/api_result.dart';
import 'package:the_top_movies/data_layer/models/data.dart';
import 'package:the_top_movies/data_layer/models/movie.dart';
import 'package:the_top_movies/data_layer/models/network_exceptions.dart';
import 'package:the_top_movies/data_layer/web_services/movies_web_services.dart';

class MoviesRepo {
  final MoviesWebServices moviesWebServices;

  MoviesRepo(this.moviesWebServices);

  Future<ApiResult<Map<String, List<Movie>?>>> getAllBestMovies() async {
    ApiResponse actionMoviesResponse =
        await moviesWebServices.getBestMovies(6.5, 50, 'like_count', 'action');
    Data? actionMoviesData = actionMoviesResponse.data;
    List<Movie>? bestActionMovies = actionMoviesData!.movies;

    print(bestActionMovies!.first.title);

    ApiResponse comedyMoviesResponse =
        await moviesWebServices.getBestMovies(6.5, 50, 'like_count', 'comedy');
    Data? comedyMoviesData = comedyMoviesResponse.data;
    List<Movie>? bestComedyMovies = comedyMoviesData!.movies;

    print(bestComedyMovies!.first.title);

    Map<String, List<Movie>?> allBestMovies = {
      'action': bestActionMovies,
      'comedy': bestComedyMovies
    };

    return ApiResult.success(allBestMovies);
  }

  Future<ApiResult<List<Movie>?>> getBestActionMovies() async {
    try {
      ApiResponse response = await moviesWebServices.getBestMovies(
          6.5, 50, 'like_count', 'action');
      Data? data = response.data;
      List<Movie>? bestActionMovies = data!.movies;
      print('${bestActionMovies!.first.title}');

      return ApiResult.success(bestActionMovies);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<List<Movie>?>> getBestComedyMovies() async {
    try {
      ApiResponse response = await moviesWebServices.getBestMovies(
          6.5, 50, 'like_count', 'comedy');
      Data? data = response.data;
      List<Movie>? bestActionMovies = data!.movies;
      print('${data!.movies!.first.title}');

      return ApiResult.success(data!.movies);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
