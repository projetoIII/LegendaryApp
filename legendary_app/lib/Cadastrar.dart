import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'RouteGenerator.dart';

class CadastrarPageView extends StatefulWidget {

  @override
  _CadastrarPageViewState createState() => _CadastrarPageViewState();
}

class _CadastrarPageViewState extends State<CadastrarPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/dogs.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child:
          Icon(Icons.arrow_forward_ios_rounded),
          backgroundColor: Colors.purple
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        width: double.infinity,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40)
          ),
        ),
        child: Container(
          // margin: EdgeInsets.all(4.0),
          alignment: Alignment.bottomCenter,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40)
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Cadastrar",
                  softWrap: true,
                  style: new TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 25.0, color: Colors.black87),
                ),
                new Expanded(
                  child: Container(),
                ),
                TextFormField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'Nome de usuário',
                        hintStyle: TextStyle( fontSize: 18.0,color: Colors.purple),
                        labelStyle: TextStyle(color: Colors.purple)
                    )
                ),
                TextFormField(
                    autofocus: true,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'E-mail',
                        hintStyle: TextStyle(fontSize: 18.0, color: Colors.purple),
                        labelStyle: TextStyle(color: Colors.purple)
                    )
                ),
                TextFormField(
                    autofocus: true,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'Senha',
                        hintStyle: TextStyle(fontSize: 18.0, color: Colors.purple),
                        labelStyle: TextStyle(color: Colors.purple)
                    )
                ),
                new Expanded(
                  child: Container(),
                ),
                InkWell(
                  child: new Text(
                    '< Voltar',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RouteGenerator.ROTA_HOME);
                    setState(() {
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,);
  }
}


