import 'package:flutter/material.dart';

class NewMoviePage extends StatelessWidget {
  const NewMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

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
