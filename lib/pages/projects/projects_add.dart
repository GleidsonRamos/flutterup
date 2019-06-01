import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_up/components/foto_upload.dart';
import 'package:flutter_up/components/storage_upload.dart';
import 'package:flutter_up/components/textbox.dart';
import 'package:flutter_up/model/model_projects.dart';
import 'package:flutter_up/model/model_ui_uix.dart';
import 'package:flutter_up/model/model_user.dart';
import 'package:image_picker/image_picker.dart';

class ProjectsAdd extends StatefulWidget {
  @override
  _ProjectsAddState createState() => _ProjectsAddState();
}

class _ProjectsAddState extends State<ProjectsAdd> {
  File _image;

  Future getImage(int number) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    String photourl = await storage.enviarFoto(image, ModelUser.instance.firebaseUser.uid+number.toString());
    setState(() {
      _photo[number] = photourl;
      _image = image;
    });
  }

  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _linkController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _userEdited = false;

  String _name;
  String _desc;
  String _link;
  int _datesubmit;
  List<String> _photo;
  String _userid;
  String _key;

  void onChangeName(String name) {
    _name = name;
  }

  void onChangeDesc(String name) {
    _desc = name;
  }

  void onChangeDesclink(String name) {
    _link = name;
  }

  void onNewPhoto(String name) {
    _photo.add(name);
  }


  @override
  void initState() {
      _photo = new List<String>(2);
  }

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
        onPressed: () {
          addProject();
        },
        child: Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 90.0),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(
                  height: 5.0,
                ),
                Textbox(
                  label: "Project Name",
                  controller: _nameController,
                  callback: onChangeName,
                ),
                Textbox(
                  label: "Project Description",
                  controller: _descController,
                  callback: onChangeDesc,
                ),
                Textbox(
                  label: "Project Link",
                  controller: _linkController,
                  callback: onChangeDesclink,
                ),
                FotoUpload(
                  foto: _photo[0],
                  titulo: "Send picture 1",
                  callback: () => getImage(0),
                ),
                FotoUpload(
                  foto: _photo[1],
                  titulo: "Send picture 2",
                  callback: () => getImage(1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addProject() async {
    Project project = new Project();
    project.name = _name;
    project.desc = _desc;
    project.link = _link;
    project.photo = _photo;
    project.datesubmit = DateTime.now().microsecondsSinceEpoch;
    project.key = ModelUser.instance.firebaseUser.uid;
    project.userid = ModelUser.instance.firebaseUser.uid;


    await Modelproject.instance.createNewProject(project);

    Navigator.pop(context);
  }
}
