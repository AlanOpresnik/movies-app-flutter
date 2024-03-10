import 'package:cinema_pedia/presentations/screens/movies/movie_screen.dart';
import 'package:cinema_pedia/presentations/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    name: HomeScreen.name,
    routes: [
      GoRoute(
        path: "movie/:id",
        name: MovieScreen.name,
        builder: (context, state) {
          final movieid = state.pathParameters['id'] ?? "no-id";
          return MovieScreen(
            movieId: movieid,
          );
        },
      ),
    ],
    builder: (context, state) => const HomeScreen(),
  ),
]);
