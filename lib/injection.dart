import 'package:movies_app/data/repositories/movie_repository_impl.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/delete_movie.dart';
import 'package:movies_app/domain/usecases/get_all_movies.dart';
import 'package:movies_app/domain/usecases/save_movie.dart';
import 'package:movies_app/presentation/bloc/movie_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initializeDependencies()
{
  // Repositories
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl()
  );

  // Use cases
  getIt.registerLazySingleton(
    () => GetAllMovies(getIt<MovieRepository>())
  );
  getIt.registerLazySingleton(
    () => SaveMovie(getIt<MovieRepository>())
  );
  getIt.registerLazySingleton(
    () => DeleteMovie(getIt<MovieRepository>())
  );

  // BLoCs
  getIt.registerFactory(
    () => MovieBloc(
      getAllMovies: getIt<GetAllMovies>(),
      saveMovie: getIt<SaveMovie>(),
      deleteMovie: getIt<DeleteMovie>(),
    ),
  );
}