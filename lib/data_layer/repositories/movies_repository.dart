import '../models/api_response.dart';
import '../models/api_result.dart';
import '../models/data.dart';
import '../models/movie.dart';
import '../models/network_exceptions.dart';
import '../web_services/movies_web_services.dart';

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
