import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:legendary_app/res/RouteGenerator.dart';
import 'package:legendary_app/view/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePageView(),
        theme: ThemeData(
            primaryColor: Colors.purple,
            appBarTheme: AppBarTheme(color: Color(0xFFCE93D8))),
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false);
  }
}
