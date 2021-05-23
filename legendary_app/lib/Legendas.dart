import 'package:flutter/material.dart';
import 'package:legendary_app/widgets/LegendaCard.dart';

class LegendasView extends StatefulWidget {
  @override
  _LegendasViewState createState() => _LegendasViewState();
}

class _LegendasViewState extends State<LegendasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCE93D8),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('LEGENDAS')
      ),
      body: Column(
        children: <Widget>[
          LegendaCard()
        ],
      ),
    );
  }
}
