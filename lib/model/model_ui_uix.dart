import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_up/model/model_projects.dart';

import 'model_user.dart';

class Modelproject {
  //Singleton
  Modelproject._() {}
  static Modelproject _instance = new Modelproject._();
  static Modelproject get instance => _instance;


  //Atributos
  List<Project> _projectaDataUiUx = new List<Project>();
  //Get
  List<Project> get projectaDataUiUx => _projectaDataUiUx;


  Future<Null> observarProjectUiUx() async {
    
    int now = DateTime.now().microsecondsSinceEpoch;
    Duration duration = new Duration(hours: 24);
    int yesterday = DateTime.now().subtract(duration).microsecondsSinceEpoch;

    Query reference = Firestore.instance
        .collection("uiux")
        .where("datesubmit",isLessThanOrEqualTo: now)
        .where("datesubmit", isGreaterThanOrEqualTo: yesterday)
        .orderBy("datesubmit");

    reference.snapshots().listen((querySnapshot) {
      querySnapshot.documents.forEach((doc) {
        _projectaDataUiUx.add(Project.fromJson(doc.data, doc.documentID));
      });
    });
  }

  Future<Null> createNewProject(Project project) async {

    CollectionReference reference = Firestore.instance.collection("uiux");

    reference.document(ModelUser.instance.firebaseUser.uid).setData(project.toJson());

    reference.snapshots().listen((querySnapshot) {
      querySnapshot.documents.forEach((doc) {
        _projectaDataUiUx.add(Project.fromJson(doc.data, doc.documentID));
      });
    });
  }

  Future<Project> getProject(String id) async{
    Project project = new Project();
    DocumentReference reference = Firestore.instance
        .collection("uiux")
        .document(id);

    DocumentSnapshot doc = await reference.get();
    project = Project.fromJson(doc.data, doc.documentID);

    return project;
  }
}