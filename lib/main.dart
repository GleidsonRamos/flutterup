import 'package:flutter/material.dart';
import 'package:flutter_up/pages/home.dart';
import 'package:flutter_up/pages/login/login.dart';
import 'package:flutter_up/pages/register/password_recovery.dart';
import 'package:flutter_up/pages/register/register.dart';
import 'package:flutter_up/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'iBêlo Barbers',
        debugShowCheckedModeBanner: false,
        home: Login(),
        routes: <String, WidgetBuilder>{
          '/login/login': (BuildContext context) =>  Login(),
          '/register/register': (BuildContext context) =>  Register(),
          '/register/password_recovery': (BuildContext context) =>  PasswordRecovery(),
        });
  }
}
