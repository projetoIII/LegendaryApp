import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:legendary_app/LegendaInterface.dart';
import 'package:legendary_app/util/TagLista.dart';
import 'package:legendary_app/widgets/LegendaCard.dart';
import 'package:legendary_app/widgets/TagBusca.dart';
import 'package:http/http.dart' as http;

class LegendasView extends StatefulWidget {

  @override
  _LegendasViewState createState() => _LegendasViewState();
}

Future<List<LegendaInterface>> fetchLegendas(http.Client client) async {

  List<String> parametersList = TagLista().getList;
  String parameters = "?";

  for(var pa in parametersList){
    parameters+="mus=${pa}&";
  }

  String url = "http://90b6f9d2437c.ngrok.io";
  String params = parameters.substring(0, parameters.length - 1);

  final response = await client
      .get(Uri.parse('${url}/legendas${params}'));

  return compute(parseLegendas, response.body);
}

List<LegendaInterface> parseLegendas(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<LegendaInterface>((json) => LegendaInterface.fromJson(json)).toList();
}

class _LegendasViewState extends State<LegendasView> {

  List<String> tags = TagLista().getList;
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
          scrollDirection: Axis.vertical,
          child: Column(
              children: <Widget>[
                TagBusca(
                  tags: tags,
                ),
                FutureBuilder<List<LegendaInterface>>(
                  future: fetchLegendas(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? LegendaCard(
                      legendas: snapshot.data!,
                      favorito: _favorito,
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
              ],
            ),
          ),
        )
    );
  }
}
