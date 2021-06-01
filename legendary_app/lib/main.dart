import 'package:flutter/material.dart';
import 'package:legendary_app/Home.dart';
import 'RouteGenerator.dart';

void main() {
  runApp(MaterialApp(
      home: HomePageView(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color(0xFFCE93D8)
          )
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false
  ));
}
