import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
            child: Text("Página modelo para Rotas")
        )
    );
  }
}