import 'package:mobx/mobx.dart';
import 'package:simple_crud_app/movie.dart';

part 'movie_list.g.dart';

// enum VisibilityFilter { all, pending, completed }

class MovieList = _MovieList with _$MovieList;

abstract class _MovieList with Store {
  // //1
  // @observable
  // ObservableList<Movie> movies = ObservableList<Movie>();

  // @observable
  // VisibilityFilter filter = VisibilityFilter.all;

  // //2
  // @computed
  // ObservableList<Movie> get pendingTodos =>
  //     ObservableList.of(movies.where((movie) => movie.done != true));

  // @computed
  // ObservableList<Movie> get completedTodos =>
  //     ObservableList.of(movies.where((movie) => movie.done == true));

  // @computed
  // bool get hasCompletedTodos => completedTodos.isNotEmpty;

  // @computed
  // bool get hasPendingTodos => pendingTodos.isNotEmpty;

  // @computed
  // String get itemsDescription {
  //   if (movies.isEmpty) {
  //     return "There are no Todos here. Why don't you add one?.";
  //   }

  //   final suffix = pendingTodos.length == 1 ? 'movie' : 'movies';
  //   return '${pendingTodos.length} pending $suffix, ${completedTodos.length} completed';
  // }

  // @computed
  // ObservableList<Movie> get visibleTodos {
  //   switch (filter) {
  //     case VisibilityFilter.pending:
  //       return pendingTodos;
  //     case VisibilityFilter.completed:
  //       return completedTodos;
  //     default:
  //       return movies;
  //   }
  // }

  // @computed
  // bool get canRemoveAllCompleted =>
  //     hasCompletedTodos && filter != VisibilityFilter.pending;

  // @computed
  // bool get canMarkAllCompleted =>
  //     hasPendingTodos && filter != VisibilityFilter.completed;

  // //3
  // @action
  // void addTodo(String description) {
  //   final movie = Movie(description);
  //   movies.add(movie);
  // }

  // @action
  // void removeTodo(Movie movie) {
  //   movies.removeWhere((x) => x == movie);
  // }

  // @action
  // void changeFilter(VisibilityFilter filter) => this.filter = filter;

  // @action
  // void removeCompleted() {
  //   movies.removeWhere((movie) => movie.done);
  // }

  // @action
  // void markAllAsCompleted() {
  //   for (final movie in movies) {
  //     movie.done = true;
  //   }
  // }

  @observable
  //Arr of Movie class
  ObservableList<Movie> movies = ObservableList<Movie>();

  @action
  void create(
      String reqTitle, String reqDirector, String reqSummary, String reqTags) {
    final newPrimaryKey = movies.last.primaryKey + 1;
    final movie =
        Movie(newPrimaryKey, reqTitle, reqDirector, reqSummary, reqTags);
    movies.add(movie);
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
