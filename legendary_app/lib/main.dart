import 'package:flutter/material.dart';

import 'Favoritos.dart';
import 'RouteGenerator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: FavoritesPage(),
      theme: ThemeData(
          primaryColor: Colors.purple,
          appBarTheme: AppBarTheme(color: Color(0xFFCE93D8))),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false));
}
