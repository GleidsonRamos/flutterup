import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: Padding(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 100.0),
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
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Mensagem", style: TextStyle(color: Colors.white),),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Row(
                  children: <Widget>[
                    _buildCategoryItens("1"),
                    _buildCategoryItens("1"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Row(
                    children: <Widget>[
                      _buildCategoryItens("1"),
                      _buildCategoryItens("1"),
                    ],
                  ),
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}

Widget _buildCategoryItens(String level){
  return Padding(
      padding: EdgeInsets.only(left: 87.0),
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 0.3, color: Colors.grey[400])),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 25.0,
              left: 30.0,
              child: Text(
                level,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
  );
}
