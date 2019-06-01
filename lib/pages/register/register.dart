import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_up/model/model_user.dart';
import 'package:flutter_up/pages/login/login.dart';
import 'package:mask_shifter/mask_shifter.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FirebaseStorage storage = FirebaseStorage.instance;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _githubController = TextEditingController();
  bool _progressIndicator = false;
  bool _userEdited = false;
  bool _fotoIsLoading = false;
  String _name,
      _email,
      _confirmEmail,
      _password,
      _confirmPassword,
      _phone,
      _github;

  final _formKey = GlobalKey<FormState>();

  void onChange() {
    _userEdited = true;
  }

  @override
  void initState() {
    _nameController.addListener(onChange);
    _emailController.addListener(onChange);
    _confirmEmailController.addListener(onChange);
    _passwordController.addListener(onChange);
    _confirmPasswordController.addListener(onChange);
    _phoneController.addListener(onChange);
    _githubController.addListener(onChange);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Create Your Account",
            style: TextStyle(fontSize: 16.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 90.0),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter your name.';
                        }
                      },
                      onSaved: (input) => _name = input,
                      decoration: InputDecoration(
                          labelText: "Name",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _nameController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 30,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter your email.';
                        }
                      },
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _emailController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 30,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                   const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Confirm your email.';
                        } else if (input != _emailController.text) {
                          return 'Emails do not match.';
                        }
                      },
                      onSaved: (input) => _confirmEmail = input,
                      decoration: InputDecoration(
                          labelText: "Confirm Email",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _confirmEmailController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 30,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter your password.';
                        } else if (input.length < 6) {
                          return 'Your password must be longer than 6 characters.';
                        }
                      },
                      onSaved: (input) => _password = input,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _passwordController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 20,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                   const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Confirm your password.';
                        } else if (input != _passwordController.text) {
                          return 'Passwords do not match.';
                        }
                      },
                      onSaved: (input) => _confirmPassword = input,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Confirm Password",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _confirmPasswordController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 20,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter your github.';
                        }
                      },
                      onSaved: (input) => _github = input,
                      decoration: InputDecoration(
                          labelText: "Github",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _githubController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 40,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                   const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter your phone.';
                        }
                      },
                      onSaved: (input) => _phone = input,
                      decoration: InputDecoration(
                          labelText: "Phone",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _phoneController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 20,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
                _progressIndicator == false
                    ? Container(
                        width: 200,
                        height: 60, //Mesma altura do end do Tween
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            signUp();
                          },
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 100),
                        child: Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.black))),
                      ),
              ],
            ),
          ),
        ));
  }

  Future<void> signUp() async {
    final _formState = _formKey.currentState;

    if (_formState.validate()) {
      _formState.save();
      try {
        setState(() {
          _progressIndicator = true;
        });
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _email.trimRight().trimLeft(),
            password: _password);

/*        Firestore.instance.collection("users").document(user.uid).setData({
          "Name":convertsFirstLetterToUppercase(_name.trimRight().trimLeft()),
          "Created_In":  DateTime.now(),
          "Email": _email.trimRight().trimLeft(),
          "Phone": _phone,

        });*/

      } catch (e) {
        setState(() {
          _progressIndicator = false;
        });
        print(e);
      } finally {
        ModelUser.instance.signIn(
          email: _email.trimRight().trimLeft(),
          pass: _password,
          onSuccess: () {
            Navigator.pushNamed(context, "/home");
          },
          onFail: () {
            Navigator.pushNamed(context, "/login/login");
          },
        );
      }
    }
  }

  String convertsFirstLetterToUppercase(String name) {
    String firstLetter = name.substring(0, 1).toUpperCase();
    return firstLetter + name.substring(1, name.length);
  }
}
