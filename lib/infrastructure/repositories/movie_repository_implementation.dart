import 'package:cinema_pedia/config/domain/datasources/movies_datasource.dart';
import 'package:cinema_pedia/config/domain/entities/movie.dart';
import 'package:cinema_pedia/config/domain/respositories/movies_repository.dart';

class MovieDbRepositoryImplementation extends MovieRepository {
  final MovieDataSource dataSource;

  MovieDbRepositoryImplementation({required this.dataSource});
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return dataSource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpComming({int page = 1}) {
    return dataSource.getUpComming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id);
  }
}
