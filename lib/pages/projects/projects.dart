import 'package:flutter/material.dart';
import 'package:flutter_up/pages/projects/tiles/last_projects.dart';
import 'package:flutter_up/pages/projects/tiles/recent_projects.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "My Projects - UI/UX",
          style: TextStyle(fontSize: 18.0),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Recent projects",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[700],
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 5.0,),
            RecentProjectsTile(),
            SizedBox(height: 5.0,),
            RecentProjectsTile(),
            Divider(),
            Text(
              "Last projects",
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[700],
                  fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 5.0,),
            LastProjectsTile(),
            SizedBox(height: 5.0,),
            LastProjectsTile(),
          ],
        ),
      ),
    );
  }
}
