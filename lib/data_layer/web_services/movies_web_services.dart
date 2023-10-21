import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/api_response.dart';

part 'movies_web_services.g.dart';

@RestApi(baseUrl: 'https://yts.mx/api/v2/')
abstract class MoviesWebServices {
  factory MoviesWebServices(Dio dio, {String baseUrl}) = _MoviesWebServices;

  @GET("list_movies.json") //it is the endpoint.
  Future<ApiResponse> getBestMovies(
    @Query('minimum_rating') double minimumRating,
    @Query('limit') int limit,
    @Query('sort_by') String sortBy,
    @Query('genre') String genre,
  ); //the backend, required nothing in body or header.
}

//Future<Map<String,dynamic>>
