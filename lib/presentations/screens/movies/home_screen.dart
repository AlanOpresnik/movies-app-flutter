import 'package:cinema_pedia/presentations/providers/movies/movies_providers.dart';
import 'package:cinema_pedia/presentations/providers/movies/movies_slideshow_provider.dart';
import 'package:cinema_pedia/presentations/widgets/movies/movie_horizontal_list.dart';
import 'package:cinema_pedia/presentations/widgets/movies/movies_slideshow.dart';
import 'package:cinema_pedia/presentations/widgets/shared/custom_appbart.dart';
import 'package:cinema_pedia/presentations/widgets/shared/custom_navigation_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = "homeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _HomeView(),
      bottomNavigationBar: CustomNavigationBottom(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast);
    final slideShowMovies = ref.watch(MoviesSlideShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if (slideShowMovies.isEmpty == 0) return CircularProgressIndicator();

    return Scaffold(
        body: Column(
      children: [
        const CustomAppBar(),
        MoviesSlideShow(movies: slideShowMovies),
        MovieHorizontalListView(
            loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
            title: "En cines",
            subTitle: "Lunes 20",
            movies: nowPlayingMovies)
      ],
    ));
  }
}
