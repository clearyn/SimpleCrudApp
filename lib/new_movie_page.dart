import 'package:flutter/material.dart';

class NewMoviePage extends StatefulWidget {
  const NewMoviePage({Key? key}) : super(key: key);

  @override
  _NewMoviePageState createState() => _NewMoviePageState();
}

class _NewMoviePageState extends State<NewMoviePage> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Movie"),
        actions: [
          IconButton(
            icon: const Text('Save'),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15.0),
              //Input Title
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Title',
                ),
              ),
              SizedBox(height: 15.0),
              //Input Director
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Director',
                ),
              ),
              SizedBox(height: 15.0),
              //Input Tags
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Tags',
                ),
              ),
              SizedBox(height: 15.0),
              //Input Summary
              TextFormField(
                maxLines: 5,
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Summary',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
