import 'package:flutter/material.dart';
import 'package:legendary_app/res/RouteGenerator.dart';
import 'package:legendary_app/utils/authentication.dart';

import 'Entrar.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
      children: <Widget>[
        FutureBuilder(
          future: Authentication.initializeFirebase(context: context),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error initializing Firebase');
            } else if (snapshot.connectionState == ConnectionState.done) {
              return EntrarPageView();
            }
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.deepPurple,
              ),
            );
          },
        ),
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("images/boat.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
          ),
        ),
        Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              color: Colors.transparent,
              child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(60.0),
                        topRight: const Radius.circular(60.0),
                      )),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          margin: EdgeInsets.all(40),
                          height: 100.0,
                          child: Text(
                            "Legendary \nideias!",
                            softWrap: true,
                            style: new TextStyle(
                                fontSize: 40.0, color: Colors.purple),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          margin:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          height: 50.0,
                          child: ElevatedButton(
                              child: Text("Entrar",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  )),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteGenerator.ROTA_ENTRADA);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    side: BorderSide(color: Colors.purple)),
                                padding: EdgeInsets.all(10.0),
                                primary: Colors.purple,
                              )),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.70,
                            margin: EdgeInsets.only(top: 10.0, bottom: 20),
                            height: 50.0,
                            child: ElevatedButton(
                              child: Text("Cadastrar",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.purple)),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteGenerator.ROTA_CADASTRO);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    side: BorderSide(color: Colors.purple)),
                                padding: EdgeInsets.all(10.0),
                                primary: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  )),
            )),
      ],
    ));
  }
}
