import 'package:movies_app/domain/entities/movie.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}
class MovieLoading extends MovieState {}
