import 'package:flutter/material.dart';

import 'Home.dart';
import 'RouteGenerator.dart';

//teste
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: HomePageView(),
      theme: ThemeData(appBarTheme: AppBarTheme(color: Color(0xFFCE93D8))),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false));
}
