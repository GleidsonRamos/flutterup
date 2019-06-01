import 'package:flutter/material.dart';
import 'package:flutter_up/pages/home.dart';
import 'package:flutter_up/pages/login/login.dart';
import 'model/model_user.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  dynamic _carregarUsuario() async {
    await ModelUser.instance.isLoggedIn() == true
        ? Navigator.of(context).pushReplacement<dynamic, dynamic>(
            MaterialPageRoute<dynamic>(builder: (context) => MyHomePage()))
        : await Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pushReplacement<dynamic, dynamic>(
                MaterialPageRoute<dynamic>(builder: (context) => Login()));
          });
  }

  @override
  Widget build(BuildContext context) {
    _carregarUsuario();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(8.0, 60.0, 8.0, 8.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 30.0,
              ),
              Image.asset(
                "assets/images/fundo.png",
                width: 400,
                height: 400,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 15.0,
              ),
              CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.black)),
              const SizedBox(
                height: 25.0,
              ),
              Text(
                "Por favor, aguarde...",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
