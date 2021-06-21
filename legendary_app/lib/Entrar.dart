import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'RouteGenerator.dart';

class EntrarPageView extends StatefulWidget {

  @override
  _EntrarPageViewState createState() => _EntrarPageViewState();
}

class _EntrarPageViewState extends State<EntrarPageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc3b383),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/ballons.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width:  MediaQuery.of(context).size.height * 0.30,
              color: Colors.transparent,
              child: Center(
                child: Text(
                  'Bem-vindo(a) de volta!',
                  style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, RouteGenerator.ROTA_CADASTRARIMAGEM, (Route<dynamic> route) => false);
          },
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
                  "Entrar",
                  softWrap: true,
                  style: new TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 25.0, color: Colors.black87),
                ),
                new Expanded(
                  child: Container(),
                ),
                TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'Nome de usuário',
                        hintStyle: TextStyle( fontSize: 18.0,color: Colors.purple),
                        labelStyle: TextStyle(color: Colors.purple)
                    )
                ),
                TextFormField(
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
                SignInButton(
                  Buttons.Google,
                  text: "Continuar com o Google",
                  onPressed: () {},
                ),
                new Expanded(
                  child: Container(),
                ),
                InkWell(
                  child: new Text(
                    'Cadastre-se',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, RouteGenerator.ROTA_CADASTRO);
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


