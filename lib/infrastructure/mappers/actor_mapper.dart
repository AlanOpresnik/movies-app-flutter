import 'package:cinema_pedia/config/domain/entities/actor.dart';
import 'package:cinema_pedia/infrastructure/models/movieDb/credits_response.dart';

class ActorMapper {
   Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? "https://image.tmdb.org/t/p/w500${cast.profilePath}"
          : "https://st3.depositphotos.com/15973376/32993/v/450/depositphotos_329939238-stock-illustration-user-icon-in-trendy-flat.jpg",
      character: cast.character);
}
