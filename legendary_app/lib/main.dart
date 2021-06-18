import 'package:flutter/material.dart';
import 'package:legendary_app/Home.dart';

import 'RouteGenerator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: HomePageView(),
      theme: ThemeData(
          primaryColor: Colors.purple,
          appBarTheme: AppBarTheme(color: Color(0xFFCE93D8))),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false));
}
