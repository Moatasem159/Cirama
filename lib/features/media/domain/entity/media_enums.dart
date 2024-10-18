import 'package:flutter/material.dart';

enum MediaType {
  movie,
  tv,
}

enum ListType {
  playingNowMovie(
    mediaType: MediaType.movie,
    title: "now_playing",
    icon: Icons.circle_rounded,
    iconSize: 15,
  ),
  playingNowTvShow(
    mediaType: MediaType.tv,
    title: "on_the_air",
    icon: Icons.circle_rounded,
    iconSize: 15,
  ),
  trendingMovie(
    mediaType: MediaType.movie,
    title: "trending",
    icon: Icons.local_fire_department_outlined,
  ),
  trendingTvShow(
    mediaType: MediaType.tv,
    title: "trending",
    icon: Icons.local_fire_department_outlined,
  ),
  popularMovie(
    mediaType: MediaType.movie,
    title: "popular",
    icon: Icons.local_movies_rounded,
  ),
  popularTvShow(
    mediaType: MediaType.tv,
    title: "popular",
    icon: Icons.tv_rounded,
  ),
  topRatedMovie(
    mediaType: MediaType.movie,
    title: "top_rated",
    icon: Icons.star_rate_rounded,
  ),
  topRatedTvShow(
    mediaType: MediaType.tv,
    title: "top_rated",
    icon: Icons.star_rate_rounded,
  ),

  ratedMovies(
    mediaType: MediaType.movie,
    title: "rated",
  ),
  ratedTv(
    mediaType: MediaType.tv,
    title: "rated",
  ),
  favoriteMovies(
    mediaType: MediaType.movie,
    title: "favorite",
  ),
  favoriteTv(
    mediaType: MediaType.tv,
    title: "favorite",
  ),
  watchlistMovies(
    mediaType: MediaType.movie,
    title: "watchlist",
  ),
  watchlistTv(
    mediaType: MediaType.tv,
    title: "watchlist",
  ),
  noMovieList(
    mediaType: MediaType.movie,
    title: "no_movie_list",
  ),
  noTvShowList(
    mediaType: MediaType.tv,
    title: "no_tv_show_list",
  );


  final MediaType mediaType;
  final String title;
  final IconData? icon;
  final double iconSize;

  const ListType({
    required this.mediaType,
    required this.title,
    this.icon,
    this.iconSize = 20,
  });
}