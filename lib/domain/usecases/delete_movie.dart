import 'package:movies_app/domain/repositories/movie_repository.dart';

class DeleteMovie {
  final MovieRepository repository;

  DeleteMovie(this.repository);

  Future<void> execute(String id) async {
    return repository.deleteMovie(id);
  }
  
}