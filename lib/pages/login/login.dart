import 'package:flutter/material.dart';
import 'package:flutter_up/model/model_user.dart';
import 'package:flutter_up/pages/home.dart';
import 'package:flutter_up/pages/register/password_recovery.dart';
import 'package:flutter_up/pages/register/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  String _email, _password;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _progressIndicator = false;

  @override
  void initState() {
    super.initState();
  }

  Widget FormContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 70, bottom: 32),
              child: Image.asset(
                "assets/images/fundo.png",
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
              ),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Por favor digite o seu e-mail';
                  }
                },
                onSaved: (input) => _email = input,
                obscureText: false,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                    left: 5.0,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
              ),
              child: TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'A senha deve ter mais de 6 caracteres';
                  }
                },
                onSaved: (input) => _password = input,
                obscureText: true,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                    left: 5.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final _formState = _formKey.currentState;

    if (_formState.validate()) {
      _formState.save();
      setState(() {
        _progressIndicator = true;
      });
   ModelUser.instance.signIn(
          email: _email.trimRight().trimLeft(),
          pass: _password,
          onSuccess: () {
            Navigator.pushNamed(context, "/home");
          },
          onFail: _onFail);
    }
  }

  void _onFail() {
    setState(() {
      _progressIndicator = false;
    });
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: const Text("Falha ao Entrar!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }

  Widget RegisterButton() {
    return FlatButton(
      padding: const EdgeInsets.only(top: 120),
      onPressed: () {
        Navigator.pushNamed(context, "/register/register");
      },
      child: const Text(
        "Don`t have an account ? Sign Up now!",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontSize: 13,
            letterSpacing: 0.5),
      ),
    );
  }

  Widget ForgotPassword() {
    return FlatButton(
      padding: const EdgeInsets.only(top: 10),
      onPressed: () {
        Navigator.pushNamed(context, "/register/password_recovery");
      },
      child: const Text(
        "Forgot Password?",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontSize: 13,
            letterSpacing: 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(0.0), BlendMode.luminosity),
                image: AssetImage("assets/images/fundo.png"),
                fit: BoxFit.cover)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
/*                    Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 32),
                      child: Image.asset(
                        "assets/images/fundo.png",
                        width: 180,
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                    ),*/
                    FormContainer(),
                    _progressIndicator == true ? Container() : ForgotPassword(),
                    _progressIndicator == true ? Container() : RegisterButton(),
                  ],
                ),
                _progressIndicator == true
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(top: 50, bottom: 50),
                        child: ButtonTheme(
                          minWidth: 270.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: () async {
                              signIn();
                            },
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ),
                      )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 70, bottom: 50),
              child: Center(
                  child: _progressIndicator == true
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black))
                      : Container()),
            ),
          ],
        ),
      ),
    );
  }
}
