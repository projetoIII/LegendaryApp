import 'package:flutter/material.dart';
import 'package:legendary_app/model/URL.dart';
import 'package:legendary_app/res/RouteGenerator.dart';

class InputURL extends StatefulWidget {
  @override
  _InputURLState createState() => _InputURLState();
}

class _InputURLState extends State<InputURL> {

  String valor = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xffBA68C8),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, RouteGenerator.ROTA_CADASTRARIMAGEM);
            }),
        title: Text(
          'URL',
          style: TextStyle(color: Color(0xffBA68C8)),
        ),
      ),
      body: Container(
          color: Color(0xffFFFFFF),
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                      TextFormField(
                        textAlign: TextAlign.center,
                        onFieldSubmitted: (String value){
                          setState(() {
                            URL.url = value;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "URL aqui",
                            hintStyle: TextStyle(fontSize: 18.0, color: Colors.purple),
                            labelStyle: TextStyle(color: Colors.purple)),),
            ]
          ),
      ),
    ));
  }
}
