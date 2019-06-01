import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_up/pages/project/details.dart';

import '../project_description.dart';

class RecentProjectsTile extends StatefulWidget {
  @override
  _RecentProjectsTileState createState() => _RecentProjectsTileState();
}

class _RecentProjectsTileState extends State<RecentProjectsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Material(
        child: Container(
          width: double.infinity,
          child: Card(
              color: Colors.white,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProjectDescription(true)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
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
                                left: 22.0,
                                child: Text(
                                  "15h",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Container(
                          color: Colors.grey[300],
                          height: 60.0,
                          width: 0.5,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Flutter Up"),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text("UX/UI"),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star, size: 15.0,),
                                SizedBox(width: 5.0,),
                                Text("4.5")
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                offset: new Offset(0.0, 1.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
