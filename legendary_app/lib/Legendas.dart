import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:legendary_app/LegendaInterface.dart';
import 'package:legendary_app/widgets/LegendaCard.dart';
import 'package:legendary_app/widgets/TagBusca.dart';
import 'package:http/http.dart' as http;

class LegendasView extends StatefulWidget {
  @override
  _LegendasViewState createState() => _LegendasViewState();
}

Future<List<LegendaInterface>> fetchLegendas(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://60bf73d997295a0017c42e86.mockapi.io/legenda'));

  return compute(parseLegendas, response.body);
}

List<LegendaInterface> parseLegendas(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<LegendaInterface>((json) => LegendaInterface.fromJson(json)).toList();
}

class _LegendasViewState extends State<LegendasView> {

  // String _legenda = "Let the sun illuminate the word that you could not find";
  // String _titulo = "Unwritten, Natasha Bedingfield";
  // bool _categoria = true;
  List<String> _tags = ['sol', 'cachorro', 'sun', 'flor', 'oculos'];
  bool _favorito = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCE93D8),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('LEGENDAS'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TagBusca(
                tags: _tags,
              ),
              FutureBuilder<List<LegendaInterface>>(
                future: fetchLegendas(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? LegendaCard(
                          legendas: snapshot.data!,
                          onFavorite: (bool val){
                            setState((){
                              val = !val;
                              _favorito = val;
                            });
                          },
                        )
                      : Center(child: CircularProgressIndicator());
                },
              ),
              // LegendaCard(
              //   legenda: _legenda,
              //   titulo: _titulo,
              //   categoria: _categoria,
              //   favorito: _favorito,
              //   onFavorite: (bool val){
              //     setState((){
              //       val = !val;
              //       _favorito = val;
              //     });
              //   },
              // ),
            ],
          ),
        )
      ),
    );
  }
}
