import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProjectDescription extends StatefulWidget {
  final bool openedToVote;

  ProjectDescription(this.openedToVote);

  @override
  _ProjectDescriptionState createState() => _ProjectDescriptionState();
}

class _ProjectDescriptionState extends State<ProjectDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Up",
          style: TextStyle(fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      floatingActionButton: widget.openedToVote
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.star),
            )
          : Container(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 90.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    !widget.openedToVote
                        ? Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Container(
                              width: 90.0,
                              height: 70.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 25.0,
                                    left: 12.0,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          size: 25.0,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          "4.5",
                                          style: TextStyle(fontSize: 25.0),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 0.3, color: Colors.grey[400])),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("UX/UI"),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "1.503",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Text(" vote(s)")
                              ],
                            ),
                            Container()
                          ],
                        ),
                        widget.openedToVote
                            ? Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            size: 15.0,
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text("4.5")
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Container()
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 13.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[500]),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.",
                      style: TextStyle(),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    gallery(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ButtonTheme(
                          minWidth: 270.0,
                          height: 50.0,
                          child: RaisedButton(
//                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            onPressed: () async {
                                  () => {};
                            },
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Go to the project',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
//              gallery()
              ],
            ),
          ),
        ],
      ),
    );
  }

  static List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  List child = map<Widget>(
    imgList,
    (index, i) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(children: <Widget>[
            Image.network(i, fit: BoxFit.cover, width: 1000.0),
          ]),
        ),
      );
    },
  ).toList();

  Widget gallery() {
    return CarouselSlider(
//      height: 200.0,
      items: child,
    );
  }
}
