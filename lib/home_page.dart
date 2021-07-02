import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_crud_app/movie.dart';
import 'package:simple_crud_app/router.gr.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud_app/movie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple CRUD App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          //Movies Widget
          child: Container(
            //Todo: Delete Color Marker
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      //Title Movies Bar
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          height: 30,
                          //Todo: Delete Color Marker
                          color: Colors.amber,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Movies',
                            ),
                          ),
                        ),
                      ),
                      //New Movies Button
                      GestureDetector(
                        onTap: () {
                          context.pushRoute(DetailMovieRoute());
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
                                'New',
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
                  MoviesList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MoviesList extends StatelessWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<MovieList>(context);

    return ConstrainedBox(
      constraints: new BoxConstraints(
        maxHeight: 300,
      ),
      child: Scrollbar(
        showTrackOnHover: true,
        child: Observer(
          builder: (_) {
            if (list.movies.length > 0) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: list.movies.length,
                itemBuilder: (_, index) {
                  final movie = list.movies[index];
                  return MoviePanelListWidget(
                    title: movie.title,
                    director: movie.director,
                    movieData: movie,
                  );
                },
              );
            } else {
              return Text(
                'No Movies, add new one',
                style: TextStyle(color: Colors.white),
              );
            }
          },
        ),
      ),
    );
  }
}

//Movie Panel Widget Inside List
class MoviePanelListWidget extends StatelessWidget {
  const MoviePanelListWidget(
      {Key? key,
      required this.title,
      required this.director,
      required this.movieData})
      : super(key: key);
  final String title;
  final String director;
  final Movie movieData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () => context.pushRoute(DetailMovieRoute(movieData: movieData)),
        child: Container(
          height: 50,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                  child: Container(
                color: Colors.amber,
                child: Text(title),
              )),
              Flexible(
                  child: Container(
                color: Colors.orange,
                child: Text(director),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
