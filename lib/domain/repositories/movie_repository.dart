
import 'package:movies_app/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getAllMovies();
  Future<Movie> getMovieById(String id);
  Future<void> saveMovie(Movie movie);
  Future<void> deleteMovie(String id);
}