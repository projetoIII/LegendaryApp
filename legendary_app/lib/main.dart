import 'package:flutter/material.dart';
import 'package:legendary_app/Home.dart';
import 'Cadastrar.dart';
import 'Entrar.dart';
import 'RouteGenerator.dart';

void main() {
  runApp(MaterialApp(
      home: HomePageView(),
      theme: ThemeData(
          primaryColor: Colors.purple
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false
  ));
}
