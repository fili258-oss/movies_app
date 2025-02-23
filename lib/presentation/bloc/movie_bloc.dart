import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/usecases/delete_movie.dart';
import 'package:movies_app/domain/usecases/get_all_movies.dart';
import 'package:movies_app/domain/usecases/save_movie.dart';
import 'package:movies_app/presentation/bloc/movie_event.dart';
import 'package:movies_app/presentation/bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState>{
  final GetAllMovies getAllMovies;
  final SaveMovie saveMovie;
  final DeleteMovie deleteMovie;

  MovieBloc({
    required this.getAllMovies,
    required this.saveMovie,
    required this.deleteMovie,

  }) : super(MovieInitial()){
    on<LoadMovies>(_onLoadMovies);
    on<AddMovie>(_onAddMovie);
    on<DeleteMovieEvent>(_onDeleteMovie);
  }

  Future<void> _onLoadMovies(
    LoadMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());
    try {
      final movies = await getAllMovies.execute();
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }  

  Future<void> _onAddMovie(
    AddMovie event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());
    try {
      await saveMovie.execute(event.movie);
      final movies = await getAllMovies.execute();
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> _onDeleteMovie(
    DeleteMovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());
    try {
      await deleteMovie.execute(event.id);
      final movies = await getAllMovies.execute();
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}