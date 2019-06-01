import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_up/model/model_user.dart';

class PasswordRecovery extends StatefulWidget {
  @override
  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final _emailController = TextEditingController();
  final _confirmarEmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email, _confirmarEmail;

  Widget buttonRecoveryPassword() {
    return Container(
      width: 200,
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: GestureDetector(
        onTap: () {
          _requestPassword();
        },
        child: Text(
          "Alterar senha",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPassword() {
    showDialog<dynamic>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Você deseja resetar a sua senha ?"),
            content:
                Text("Um email lhe será enviado com as devidas instruções."),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Sim"),
                onPressed: () {
                  Navigator.pop(context);
                  ModelUser.instance.recoverPass(_emailController.text);
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text(
                      "Confira o seu e-mail!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    duration: Duration(seconds: 3),
                  ));
                },
              ),
            ],
          );
        });
    return Future.value(false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            "Recuperar Senha",
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
                const SizedBox(
                  height: 10.0,
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (dynamic input) {
                        if (input.isEmpty) {
                          return 'Confirme o email da barbearia.';
                        } else if (input != _emailController.text) {
                          return 'Os emails não combinam.';
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
                      maxLength: 60,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      validator: (dynamic input) {
                        if (input.isEmpty) {
                          return 'Confirme o email da barbearia.';
                        } else if (input != _emailController.text) {
                          return 'Os emails não combinam.';
                        }
                      },
                      onSaved: (input) => _confirmarEmail = input,
                      decoration: InputDecoration(
                          labelText: "Confirmar o Email",
                          hintStyle: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.black,
                          )),
                      controller: _confirmarEmailController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxLength: 60,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                buttonRecoveryPassword(),
              ],
            ),
          ),
        ));
  }
}
