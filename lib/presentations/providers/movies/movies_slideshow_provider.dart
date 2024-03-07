

import 'package:cinema_pedia/config/domain/entities/movie.dart';
import 'package:cinema_pedia/presentations/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final MoviesSlideShowProvider = Provider<List<Movie>>((ref) {
      final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

      if(nowPlayingMovies.isEmpty) return [];
      return nowPlayingMovies.sublist(0,6);
});