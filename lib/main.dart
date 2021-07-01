import 'package:flutter/material.dart';
import 'package:simple_crud_app/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final router = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp.router(
          title: 'Simple CRUD App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          routeInformationParser: router.defaultRouteParser(),
          routerDelegate: router.delegate()),
    );
  }
}
