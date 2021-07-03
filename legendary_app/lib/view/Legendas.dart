import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:legendary_app/common/legendas/LegendaCard.dart';
import 'package:legendary_app/common/legendas/TagBusca.dart';
import 'package:legendary_app/model/URL.dart';
import 'package:legendary_app/res/custom_colors.dart';
import 'package:legendary_app/usercase/LegendaInterface.dart';
import 'package:legendary_app/widgets/widgets.dart';

class LegendasView extends StatefulWidget {
  final List<String> tags;
  LegendasView(this.tags);

  @override
  _LegendasViewState createState() => _LegendasViewState();
}

Future<List<LegendaInterface>> fetchLegendas(
    http.Client client, List<String> tags) async {
  List<String> parametersList = tags;

  String parameters = "?";

  for (var pa in parametersList) {
    parameters += "mus=${pa}&";
  }

  String url = URL.url;
  String params = parameters.substring(0, parameters.length - 1);

  final response = await client.get(Uri.parse('${url}/legendas${params}'));

  return compute(parseLegendas, response.body);
}

List<LegendaInterface> parseLegendas(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<LegendaInterface>((json) => LegendaInterface.fromJson(json))
      .toList();
}

class _LegendasViewState extends State<LegendasView> {
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
                  tags: widget.tags,
                ),
                FutureBuilder<List<LegendaInterface>>(
                  future: fetchLegendas(http.Client(), widget.tags),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? LegendaCard(legendas: snapshot.data!)
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: buildLoading(context, CustomColors.white,
                                CustomColors.white, Colors.purple),
                          );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
