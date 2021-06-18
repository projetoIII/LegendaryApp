import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Legendas.dart';
import 'RouteGenerator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      home: LegendasView(),
      theme: ThemeData(
          primaryColor: Colors.purple,
          appBarTheme: AppBarTheme(color: Color(0xFFCE93D8))),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false));
}
