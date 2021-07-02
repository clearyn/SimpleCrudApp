import 'package:mobx/mobx.dart';
import 'package:simple_crud_app/movie.dart';

part 'movie_list.g.dart';

// enum VisibilityFilter { all, pending, completed }

class MovieList = _MovieList with _$MovieList;

abstract class _MovieList with Store {
  @observable
  //Arr of Movie class
  ObservableList<Movie> movies = ObservableList<Movie>();

  @action
  void create(String reqTitle, String reqDirector, String reqSummary,
      List<String> reqTags) {
    final newPrimaryKey = movies.length <= 0 ? 0 : movies.last.primaryKey + 1;
    final newMovie = Movie(
      newPrimaryKey,
      reqTitle,
      reqDirector,
      reqSummary,
      reqTags,
    );
    movies.add(newMovie);
  }

  @action
  Movie read(int reqPrimaryKey) =>
      movies.firstWhere((movie) => movie.primaryKey == reqPrimaryKey);

  @action
  void update(int reqPrimaryKey, newTitle, newDirector, newSummary, newTags) {
    Movie edit =
        movies.firstWhere((movie) => movie.primaryKey == reqPrimaryKey);
    edit.director = newDirector;
    edit.title = newTitle;
    edit.summary = newSummary;
    edit.tags = newTags;
  }

  @action
  void delete(int reqPrimaryKey) {
    movies.removeWhere((movie) => movie.primaryKey == reqPrimaryKey);
  }
}
