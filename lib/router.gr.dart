// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import 'detail_movie_page.dart' as _i4;
import 'home_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    DetailMovieRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<DetailMovieRouteArgs>(
              orElse: () => const DetailMovieRouteArgs());
          return _i4.DetailMoviePage(
              key: args.key, reqMovieKey: args.reqMovieKey);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/'),
        _i1.RouteConfig(DetailMovieRoute.name, path: '/detail-movie-page')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

class DetailMovieRoute extends _i1.PageRouteInfo<DetailMovieRouteArgs> {
  DetailMovieRoute({_i2.Key? key, dynamic reqMovieKey})
      : super(name,
            path: '/detail-movie-page',
            args: DetailMovieRouteArgs(key: key, reqMovieKey: reqMovieKey));

  static const String name = 'DetailMovieRoute';
}

class DetailMovieRouteArgs {
  const DetailMovieRouteArgs({this.key, this.reqMovieKey});

  final _i2.Key? key;

  final dynamic reqMovieKey;
}
