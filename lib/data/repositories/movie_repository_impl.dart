import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {

  final List<Movie> _movies = [];

  @override
  Future<List<Movie>> getAllMovies() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _movies;

  }

  @override
  Future<Movie> getMovieById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _movies.firstWhere
    (
      (movie) => movie.id == id,
      orElse: () => throw Exception('Movie not found'),
    
    );
  }

  @override
  Future<void> saveMovie(Movie movie) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final index = _movies.indexWhere((p) => p.id == movie.id);

    if (index >= 0) {
      _movies[index] = movie;
    } else {
      _movies.add(movie);
    }    
  }

  @override
  Future<void> deleteMovie(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _movies.removeWhere((movie) => movie.id == id);
  }
}