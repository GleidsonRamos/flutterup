import 'package:flutter/material.dart';
import 'package:flutter_up/pages/projects/projects.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Flutter UP!"),
          actions: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 50.0, top: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                        top: 40,
                        left: 50,
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/flutter-icon-jpeg.jpg")
                                //AssetImage("assets/flutter-icon-jpeg.jpg")
                              )
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 70.0,
              width: width,
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Message",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:90.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildCategoryItens("1", "Code Quality", 1, context),
                  _buildCategoryItens("1", "UI/UX", 2, context),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildCategoryItens("1", "Performance", 3, context),
                    _buildCategoryItens("1", "Security", 4, context),
                  ],
                ),
            ),
          ],
        ),
      );
  }
}

Widget _buildCategoryItens(String level, String title, int category, context){
  return Column(
    children: <Widget>[
        Text(title),
        FloatingActionButton(
          onPressed: (){
            switch(category){
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Projects())
                );
                break;
            }
          },
          backgroundColor: Colors.white,
          child: Text(
            level,
            style: TextStyle(color: Colors.black),
          ),
        )
    ],
  );



}
