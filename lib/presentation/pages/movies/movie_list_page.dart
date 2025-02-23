import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/bloc/movie_bloc.dart';
import 'package:movies_app/presentation/bloc/movie_event.dart';
import 'package:movies_app/presentation/bloc/movie_state.dart';
import 'package:uuid/uuid.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state){
          if(state is MovieLoading)
          {
            return const Center(child: CircularProgressIndicator());
          }

          if(state is MovieError)
          {
            return Center(child: Text(state.message));
          }
          
          if (state is MovieLoaded) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text('\$${movie.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<MovieBloc>().add(
                            DeleteMovieEvent(movie.id),
                          );
                    },
                  ),
                );
              },
            );
          }

          return const Center(child: Text('No movies found.'));
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final movie = Movie(
            id: const Uuid().v4(),
            title: 'New movie ${DateTime.now().millisecondsSinceEpoch}',
            price: 99.99,
            description: 'A new movie description',
            imageUrl: 'https://via.placeholder.com/150',
            rating: 4.5,
            releaseDate: '${DateTime.now().year}',
          );
          context.read<MovieBloc>().add(AddMovie(movie));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}