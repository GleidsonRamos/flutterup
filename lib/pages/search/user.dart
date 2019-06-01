import 'package:flutter/material.dart';
import 'package:flutter_up/components/textbox.dart';
import 'package:flutter_up/provider/search/user.dart';
import 'package:provider/provider.dart';

class SearchUserPage extends StatefulWidget {
  SearchUserPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchUserPageState createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  TextEditingController _textUser = new TextEditingController();

  onSucessSearch(var response) {}
  onFailSearch(var response) {}

  @override
  Widget build(BuildContext context) {
    final providerUserSearch = Provider.of<ProviderUserSearch>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Search User")),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textbox(
                    label: "Username",
                    callback: providerUserSearch.setDisplayUser,
                    controller: _textUser,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              userLine(),
              userLine(),
              userLine(),
              userLine(),
              userLine(),
              userLine(),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _search,
        tooltip: 'Search',
        child: Icon(Icons.search),
      ),
    );
  }

  Widget userLine() {
    return new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Container(
                width: 50.0,
                height: 50.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxDoTa7yQRjB1gS-Dk-30ml-aSmV90BCJ_I-aqBeWS0vmd49I2")))),
          ),
          new Text("Username found", textScaleFactor: 1.5)
        ]);
  }

  void _search() {

  }
}
