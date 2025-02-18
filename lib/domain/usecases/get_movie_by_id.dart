import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/entities/movie.dart';

class GetMovieById {
  final MovieRepository repository;

  GetMovieById(this.repository);

  Future<Movie> execute(String id) {
    return repository.getMovieById(id);
  }
}