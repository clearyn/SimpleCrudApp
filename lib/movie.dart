import 'package:mobx/mobx.dart';

// Include generated file
part 'movie.g.dart';

// This is the class used by rest of your codebase
class Movie = _Movie with _$Movie;
class MovieForm = _MovieForm with _$MovieForm;

// The store-class
abstract class _Movie with Store {
  _Movie(this.primaryKey, this.title, this.director, this.summary, this.tags);

  @observable
  int primaryKey = 0;

  @observable
  String title = '';

  @observable
  String director = '';

  @observable
  String summary = '';

  @observable
  String tags = '';
}

abstract class _MovieForm with Store {
  @observable
  int primaryKey = 0;

  @observable
  String title = '';

  @observable
  String director = '';

  @observable
  String summary = '';

  @observable
  String tags = '';
}
