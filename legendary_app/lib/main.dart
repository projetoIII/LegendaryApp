import 'package:flutter/material.dart';

import 'CarregarImagem.dart';
import 'RouteGenerator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: UploadImagePage(),
      theme: ThemeData(
          primaryColor: Colors.purple,
          appBarTheme: AppBarTheme(color: Color(0xFFCE93D8))),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false));
}
