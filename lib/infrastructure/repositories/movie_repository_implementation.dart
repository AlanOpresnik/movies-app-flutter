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
}
