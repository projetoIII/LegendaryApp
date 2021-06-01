import 'package:flutter/material.dart';
import 'package:legendary_app/Home.dart';

import 'RouteGenerator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: HomePageView(),
      theme: ThemeData(primaryColor: Colors.deepPurple),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false));
}
