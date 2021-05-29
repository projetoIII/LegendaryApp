import 'package:flutter/material.dart';
import 'package:legendary_app/Home.dart';
import 'RouteGenerator.dart';
import 'package:legendary_app/CarregarImagem.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: UploadImagePage(),
      theme: ThemeData(
          primaryColor: Colors.deepPurple
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false
  ));
}
