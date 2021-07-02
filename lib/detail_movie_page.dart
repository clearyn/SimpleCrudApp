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
  String dropdownValue = "Action";
  List<String> tags = ["Action", "Comedy", "Fantasy", "Horror", "Sci-Fi"];
  List<String> selectedTags = [];

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
            Column(
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
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(8),
                    itemCount: selectedTags.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Chip(
                        label: Text('${selectedTags[index]}'),
                      );
                    }),
                //Input Tags
                // TextFormField(
                //   initialValue: movieData.tags,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     floatingLabelBehavior: FloatingLabelBehavior.always,
                //     labelText: 'Tags',
                //   ),
                //   onChanged: (value) => movieData.tags = value,
                // ),
                // DropdownButton<String>(
                //   isExpanded: true,
                //   value: dropdownValue,
                //   icon: const Icon(Icons.arrow_downward),
                //   underline: Container(
                //     height: 2,
                //     color: Colors.deepPurpleAccent,
                //   ),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownValue = newValue!;
                //     });
                //   },
                //   items: tags.map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),
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
          ],
        ),
      ),
    );
  }
}

class UpdateMovie extends StatefulWidget {
  final int uMovieKey;
  const UpdateMovie({Key? key, required this.uMovieKey}) : super(key: key);

  @override
  _UpdateMovieState createState() => _UpdateMovieState();
}

class _UpdateMovieState extends State<UpdateMovie> {
  String dropdownValue = "Action";
  List<String> tags = ["Action", "Comedy", "Fantasy", "Horror", "Sci-Fi"];
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<MovieList>(context);
    Movie movieData = list.read(widget.uMovieKey);

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
                    list.delete(widget.uMovieKey);
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
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      itemCount: movieData.tags.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Chip(
                          label: Text('${movieData.tags[index]}'),
                        );
                      }),
                  //Input Tags
                  // TextFormField(
                  //   initialValue: movieData.tags,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     floatingLabelBehavior: FloatingLabelBehavior.always,
                  //     labelText: 'Tags',
                  //   ),
                  //   onChanged: (value) => movieData.tags = value,
                  // ),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                      selectedTags.add(newValue!);
                      movieData.tags = selectedTags;
                    },
                    items: tags.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
