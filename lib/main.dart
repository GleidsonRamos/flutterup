import 'package:flutter/material.dart';
import 'package:flutter_up/pages/project/details.dart';
import 'package:flutter_up/provider/project/details.dart';
import 'package:provider/provider.dart';
import 'package:flutter_up/pages/search/user.dart';
import 'package:flutter_up/provider/search/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ProviderProjectDetail>(
        builder: (_) => ProviderProjectDetail(),
        child: ProjectDetailsPage(),
      ),
    );
  }
}
