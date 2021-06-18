import 'dart:async';

import 'package:flutter/material.dart';
import 'package:legendary_app/widgets/LegendaCard.dart';

import 'FavoritosControl.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  LegendaCardController _controller = LegendaCardController();

  Future<Iterable<LegendaCard>> get items {
    Future<Iterable<LegendaCard>> result;
    result = _controller.getAll();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'FAVORITOS',
          style: TextStyle(
            color: Colors.purple,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.purple),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
