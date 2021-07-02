import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud_app/movie.dart';
import 'package:simple_crud_app/movie_list.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
        // actions: [
        //   IconButton(
        //     icon: const Text('Save'),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: SingleChildScrollView(child: NewMovie()),
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
                        'NewMovie',
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
