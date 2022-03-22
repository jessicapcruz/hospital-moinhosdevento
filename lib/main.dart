
import 'package:flutter/material.dart';
import 'package:hospitalmoinhosdevento/pages/login/login.page.dart';
import 'package:hospitalmoinhosdevento/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final MainModel _model = MainModel();

    return ScopedModel<MainModel>(
        model: _model,
        child:  MaterialApp(
      title: 'Hospital Moinhos de Vento',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LoginPage(),
    ));
  }
}
