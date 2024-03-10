import 'package:cinema_pedia/config/domain/entities/movie.dart';
import 'package:cinema_pedia/infrastructure/models/movieDb/movie_detailes.dart';
import 'package:cinema_pedia/infrastructure/models/movieDb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDb moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: moviedb.backdropPath != ""
          ? ("https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}")
          : ("https://demofree.sirv.com/nope-not-here.jpg"),
      genreIds: moviedb.genreIds,
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: moviedb.posterPath != ""
          ? ("https://image.tmdb.org/t/p/w500/${moviedb.posterPath}")
          : ("no-poster"),
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);

  static Movie movieDetailsToEntity(MovieDetails moviedb) {
    List<int> genreIds = moviedb.genres.map((genre) => genre.id).toList();
    return Movie(
      adult: moviedb.adult,
      backdropPath: moviedb.backdropPath != ""
          ? ("https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}")
          : ("https://demofree.sirv.com/nope-not-here.jpg"),
      genreIds: genreIds,
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: moviedb.posterPath != ""
          ? ("https://image.tmdb.org/t/p/w500/${moviedb.posterPath}")
          : ("no-poster"),
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount,
    );
  }
}