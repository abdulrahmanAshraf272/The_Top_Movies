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

  Future<ApiResult<List<Movie>?>> getBestMovies(String genre) async {
    try {
      ApiResponse response =
          await moviesWebServices.getBestMovies(6.5, 50, 'like_count', genre);
      Data? data = response.data;
      List<Movie>? bestActionMovies = data!.movies;
      return ApiResult.success(bestActionMovies);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
