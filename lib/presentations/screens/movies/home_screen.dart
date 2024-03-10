import 'package:cinema_pedia/presentations/providers/movies/intial_loading_provider.dart';
import 'package:cinema_pedia/presentations/providers/movies/movies_providers.dart';
import 'package:cinema_pedia/presentations/providers/movies/movies_slideshow_provider.dart';
import 'package:cinema_pedia/presentations/widgets/movies/movie_horizontal_list.dart';
import 'package:cinema_pedia/presentations/widgets/movies/movies_slideshow.dart';
import 'package:cinema_pedia/presentations/widgets/shared/custom_appbart.dart';
import 'package:cinema_pedia/presentations/widgets/shared/custom_navigation_bottom.dart';
import 'package:cinema_pedia/presentations/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = "homeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upCommingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final intialLoading = ref.watch(intialLoadProvider);
    if(intialLoading) return const FullScreenLoader();
    const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast);
    final slideShowMovies = ref.watch(MoviesSlideShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upComingMovies = ref.watch(upCommingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);


    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(0),
          title: CustomAppBar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(((context, index) {
        return Column(
          children: [
            MoviesSlideShow(movies: slideShowMovies),
            MovieHorizontalListView(
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
                title: "En cines",
                subTitle: "Lunes 20",
                movies: nowPlayingMovies),
            MovieHorizontalListView(
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
                title: "Proximamente",
                subTitle: "En este mes",
                movies: upComingMovies),
            MovieHorizontalListView(
                loadNextPage: () {
                  ref.read(upCommingMoviesProvider.notifier).loadNextPage();
                },
                title: "Populares",
                movies: popularMovies),
            MovieHorizontalListView(
                loadNextPage: () {
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                },
                title: "Mejor calificado",
                subTitle: "Desde siempre",
                movies: topRatedMovies),
            const SizedBox(
              height: 20,
            )
          ],
        );
      }), childCount: 1))
    ]);
  }
}
