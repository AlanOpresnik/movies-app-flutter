

import 'package:cinema_pedia/config/domain/entities/actor.dart';

abstract class ActorsRespositorys {
  Future<List<Actor>> getActorsByMovie(String movieId);
}