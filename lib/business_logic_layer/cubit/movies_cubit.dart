import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:the_top_movies/business_logic_layer/cubit/result_state.dart';
import 'package:the_top_movies/data_layer/models/movie.dart';
import 'package:the_top_movies/data_layer/models/network_exceptions.dart';
import 'package:the_top_movies/data_layer/repositories/movies_repository.dart';
import 'package:the_top_movies/injection.dart';

//part 'my_state.dart';

class MovieCubit extends Cubit<ResultState<dynamic>> {
  final MoviesRepo moviesRepo;
  MovieCubit(this.moviesRepo) : super(const Idle());

  void emitgetBestMovies(String genre) async {
    var bestMovies = await moviesRepo.getBestMovies(genre);

    bestMovies.when(success: (dynamic data) {
      emit(ResultState.success(data));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
