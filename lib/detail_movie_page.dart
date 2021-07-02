import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud_app/movie.dart';
import 'package:simple_crud_app/movie_list.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({Key? key, this.movieData = ''}) : super(key: key);
  final movieData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieData is Movie ? 'Edit Movie' : 'New Movie'),
      ),
      body: SingleChildScrollView(
        child: movieData is Movie
            ? UpdateMovie(reqMovieData: movieData)
            : NewMovie(),
      ),
    );
  }
}

class NewMovie extends StatelessWidget {
  const NewMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<MovieList>(context);
    MovieForm newMovie = MovieForm();

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
  final Movie reqMovieData;
  const UpdateMovie({Key? key, required this.reqMovieData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<MovieList>(context);
    MovieForm newMovie = MovieForm();

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
                    list.delete(reqMovieData.primaryKey);
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
                    list.update(newMovie.primaryKey, newMovie.title,
                        newMovie.director, newMovie.summary, newMovie.tags);
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
                    initialValue: reqMovieData.title,
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
                    initialValue: reqMovieData.director,
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
                    initialValue: reqMovieData.tags,
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
                    initialValue: reqMovieData.summary,
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
