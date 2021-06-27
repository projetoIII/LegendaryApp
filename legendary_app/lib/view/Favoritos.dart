import 'package:flutter/material.dart';
import 'package:legendary_app/res/RouteGenerator.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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
          onPressed: () => Navigator.pushReplacementNamed(
              context, RouteGenerator.ROTA_CADASTRARIMAGEM),
        ),
      ),
    );
  }
}
