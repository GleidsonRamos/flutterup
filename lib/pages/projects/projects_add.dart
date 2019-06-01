import 'package:flutter/material.dart';

class ProjectsAdd extends StatefulWidget {
  @override
  _ProjectsAddState createState() => _ProjectsAddState();
}

class _ProjectsAddState extends State<ProjectsAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add a project",
          style: TextStyle(fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.save),
      ),
    );
  }
}
