import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:the_top_movies/business_logic_layer/cubit/result_state.dart';
import 'package:the_top_movies/data_layer/models/movie.dart';
import 'package:the_top_movies/data_layer/models/network_exceptions.dart';
import 'package:the_top_movies/data_layer/repositories/movies_repository.dart';

//part 'my_state.dart';

class MovieCubit extends Cubit<ResultState<dynamic>> {
  final MoviesRepo moviesRepo;
  MovieCubit(this.moviesRepo) : super(const Idle());

  void emitgetBestActoinMovies() async {
    var allBestMovies = await moviesRepo.getAllBestMovies();

    allBestMovies.when(success: (dynamic movies) {
      emit(ResultState.success(movies));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
