import 'package:flutter/material.dart';
import 'package:legendary_app/RouteGenerator.dart';

class HomePageView extends StatefulWidget {

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Home"),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteGenerator.ROTA_LEGENDAS);
              },
              child: const Text('Legendas'),
          )
    ));
  }
}
