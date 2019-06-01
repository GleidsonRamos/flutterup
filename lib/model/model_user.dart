import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ModelUser {
  //Singleton
  ModelUser._() {}
  static ModelUser _instance = new ModelUser._();
  static ModelUser get instance => _instance;

  //Atributos
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _firebaseUser;
  Map<String, dynamic> _userData = Map<String, dynamic>();
  bool _isLoading = false;
  static int tipoUsuario;

  //Get
  FirebaseUser get firebaseUser => _firebaseUser;
  Map<String, dynamic> get userData => _userData;
  bool get isLoading => _isLoading;

  void signIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    _isLoading = true;

    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) async {
      _firebaseUser = user;

      await _loadCurrentUser();

      onSuccess();
      _isLoading = false;
    }).catchError((Exception e) {
      onFail();
      _isLoading = false;
    });
  }

  void signUp(
      {@required String email,
      @required String pass,
      @required Function onSuccess,
      @required VoidCallback onFail}) {
    _isLoading = true;

    _auth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) async {
      onSuccess(user.uid);
      _isLoading = false;
    }).catchError((Exception e) {
      onFail();
      _isLoading = false;
    });
  }

  dynamic isLoggedIn() async {
    await _loadCurrentUser();
    return firebaseUser != null;
  }

  void signOut() async {
    await _auth.signOut();

    _userData = Map<String, dynamic>();
    _firebaseUser = null;
  }

  Future<Null> _loadCurrentUser() async {
    if (_firebaseUser == null) {
      _firebaseUser = await _auth.currentUser();
    }

    if (_firebaseUser != null) {
      if (userData["Nome"] == null) {
/*      TODO  DocumentSnapshot docUser = await Firestore.instance
            .collection("Barbearias")
            .document(firebaseUser.uid)
            .get();*/
     /*     _userData = docUser.data;*/
             _userData = null;
      }
    }
  }

  void recoverPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  void updateUserName(String newName) {
    _userData["Nome"] = newName;
  }
}
