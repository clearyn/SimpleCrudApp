// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieList on _MovieList, Store {
  final _$moviesAtom = Atom(name: '_MovieList.movies');

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$_MovieListActionController = ActionController(name: '_MovieList');

  @override
  void create(
      String reqTitle, String reqDirector, String reqSummary, String reqTags) {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.create');
    try {
      return super.create(reqTitle, reqDirector, reqSummary, reqTags);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  Movie read(int reqPrimaryKey) {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.read');
    try {
      return super.read(reqPrimaryKey);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(int reqPrimaryKey, dynamic newTitle, dynamic newDirector,
      dynamic newSummary, dynamic newTags) {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.update');
    try {
      return super
          .update(reqPrimaryKey, newTitle, newDirector, newSummary, newTags);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(int reqPrimaryKey) {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.delete');
    try {
      return super.delete(reqPrimaryKey);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies}
    ''';
  }
}
