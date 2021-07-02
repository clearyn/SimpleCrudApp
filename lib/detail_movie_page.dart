import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud_app/movie.dart';
import 'package:simple_crud_app/movie_list.dart';

class DetailMoviePage extends StatelessWidget {
  final reqMovieKey;
  const DetailMoviePage({Key? key, this.reqMovieKey = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(reqMovieKey);
    return Scaffold(
      appBar: AppBar(
        title: Text(reqMovieKey is int ? 'Edit Movie' : 'New Movie'),
      ),
      body: SingleChildScrollView(
        child: reqMovieKey is int
            ? UpdateMovie(uMovieKey: reqMovieKey)
            : NewMovie(),
      ),
    );
  }
}

class NewMovie extends StatefulWidget {
  const NewMovie({Key? key}) : super(key: key);

  @override
  _NewMovieState createState() => _NewMovieState();
}

class _NewMovieState extends State<NewMovie> {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<MovieList>(context);
    MovieForm newMovie = MovieForm();
    Object dropdownvalue;
    var items = [
      'Apple',
      'Banana',
      'Grapes',
      'Orange',
      'watermelon',
      'Pineapple'
    ];

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                //Title Widget
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: 30,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'New Movie',
                      ),
                    ),
                  ),
                ),
                //Save New Movie
                GestureDetector(
                  onTap: () {
                    list.create(newMovie.title, newMovie.director,
                        newMovie.summary, newMovie.tags);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            //Spaces
            SizedBox(height: 10),
            //Movies List
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 15.0),
                  //Input Title
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Title',
                    ),
                    onChanged: (value) => newMovie.title = value,
                  ),
                  SizedBox(height: 15.0),
                  //Input Director
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Director',
                    ),
                    onChanged: (value) => newMovie.director = value,
                  ),
                  SizedBox(height: 15.0),
                  //Input Tags
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Tags',
                    ),
                    onChanged: (value) => newMovie.tags = value,
                  ),
                  SizedBox(height: 15.0),
                  //Input Summary
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Summary',
                    ),
                    onChanged: (value) => newMovie.summary = value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateMovie extends StatelessWidget {
  final int uMovieKey;
  const UpdateMovie({Key? key, required this.uMovieKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<MovieList>(context);
    Movie movieData = list.read(uMovieKey);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                //Title Widget
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: 30,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Update Movie',
                      ),
                    ),
                  ),
                ),
                //Delete Movie Data
                GestureDetector(
                  onTap: () {
                    list.delete(uMovieKey);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                //Update Movie Data
                GestureDetector(
                  onTap: () {
                    list.update(movieData.primaryKey, movieData.title,
                        movieData.director, movieData.summary, movieData.tags);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            //Spaces
            SizedBox(height: 10),
            //Movies List
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 15.0),
                  //Input Title
                  TextFormField(
                    initialValue: movieData.title,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Title',
                    ),
                    onChanged: (value) => movieData.title = value,
                  ),
                  SizedBox(height: 15.0),
                  //Input Director
                  TextFormField(
                    initialValue: movieData.director,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Director',
                    ),
                    onChanged: (value) => movieData.director = value,
                  ),
                  SizedBox(height: 15.0),
                  //Input Tags
                  TextFormField(
                    initialValue: movieData.tags,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Tags',
                    ),
                    onChanged: (value) => movieData.tags = value,
                  ),
                  SizedBox(height: 15.0),
                  //Input Summary
                  TextFormField(
                    initialValue: movieData.summary,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Summary',
                    ),
                    onChanged: (value) => movieData.summary = value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
