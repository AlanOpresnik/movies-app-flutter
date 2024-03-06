import 'package:cinema_pedia/infrastructure/datasources/movie_db_datasource.dart';
import 'package:cinema_pedia/infrastructure/repositories/movie_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieDbRepositoryImplementation(dataSource: MovieDbDataSource());
});
