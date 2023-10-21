import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'result_state.dart';
import '../../data_layer/models/movie.dart';
import '../../data_layer/models/network_exceptions.dart';
import '../../data_layer/repositories/movies_repository.dart';
import '../../injection.dart';

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
