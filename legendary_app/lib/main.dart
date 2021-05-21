import 'package:flutter/material.dart';
import 'package:legendary_app/Home.dart';
import 'RouteGenerator.dart';

void main() {
  runApp(MaterialApp(
      home: HomePageView(),
      theme: ThemeData(
          primaryColor: Colors.deepPurple
      ),
      initialRoute: RouteGenerator.ROTA_HOME,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false
  ));
}
