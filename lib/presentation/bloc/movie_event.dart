import 'package:movies_app/domain/entities/movie.dart';

abstract class MovieEvent {}

class LoadMovies extends MovieEvent {}

class AddMovie extends MovieEvent {
  final Movie movie;
  AddMovie(this.movie);
}

class DeleteMovieEvent extends MovieEvent {
  final String id;
  DeleteMovieEvent(this.id);
}