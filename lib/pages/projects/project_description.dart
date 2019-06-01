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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
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
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 15.0,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Description", style: TextStyle(
                      fontSize: 13.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[500]
                    ),),
                    SizedBox(height: 10.0,),
                    Text(
                        "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.",
                      style: TextStyle(

                      ),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
