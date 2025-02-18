import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';

class GetAllMovies{
  final MovieRepository repository;

  GetAllMovies(this.repository);

  Future<List<Movie>> execute() async {
    return await repository.getAllMovies();
  }
}