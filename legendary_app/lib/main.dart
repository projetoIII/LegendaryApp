import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'RouteGenerator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      home: HomePageView(),
      theme: ThemeData(appBarTheme: AppBarTheme(color: Color(0xFFCE93D8))),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false));
}
