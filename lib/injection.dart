import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'business_logic_layer/cubit/movies_cubit.dart';
import 'data_layer/repositories/movies_repository.dart';
import 'data_layer/web_services/movies_web_services.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<MovieCubit>(() => MovieCubit(getIt()));
  getIt.registerLazySingleton<MoviesRepo>(() => MoviesRepo(getIt()));
  getIt.registerLazySingleton<MoviesWebServices>(
      () => MoviesWebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = Duration(seconds: 10)
    ..options.receiveTimeout = Duration(seconds: 10);

  dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true));

  return dio;
}
