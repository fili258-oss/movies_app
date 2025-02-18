import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/entities/movie.dart';

class SaveMovie {
  final MovieRepository repository;

  SaveMovie(this.repository);

  Future<void> execute(Movie movie) async {
    return repository.saveMovie(movie);
  }
}