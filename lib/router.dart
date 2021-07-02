import 'package:auto_route/auto_route.dart';
import 'package:simple_crud_app/home_page.dart';
import 'package:simple_crud_app/detail_movie_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: DetailMoviePage),
  ],
)
class $AppRouter {}
