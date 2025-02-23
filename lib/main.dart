import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/injection.dart';
import 'package:movies_app/presentation/bloc/movie_bloc.dart';
import 'package:movies_app/presentation/bloc/movie_event.dart';
import 'package:movies_app/presentation/pages/movies/movie_list_page.dart';

void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Movies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => getIt<MovieBloc>()..add(LoadMovies()),
        child: const MovieListPage(),
      ),
    );
  }
}
