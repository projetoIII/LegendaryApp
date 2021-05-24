import 'package:flutter/material.dart';

class LegendaCard extends StatelessWidget {

  // final String legenda = ;
  // final String titulo;
  // final bool categoria;
  // final bool favorito;
  //
  // LegendaCard({
  //   @required this.legenda,
  //   @required this.titulo,
  //   @required this.categoria,
  //   @required this.favorito,
  // });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 70,
            child: Card(
              color: Color(0xFFEBBAF3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.music_note, size: 30, color: Colors.white,),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color(0xFFEBBAF3),
              child: Row(
                children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 130,
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  "Teste",
                                  style: TextStyle(
                                      color: Colors.white
                                  )),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text(
                                  "Titulo",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  )),
                            ],
                          )
                      )
                  ),
                  IconButton(
                      icon: Icon(Icons.favorite_border, size: 30),
                      color: Colors.white,
                      onPressed: () {

                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
