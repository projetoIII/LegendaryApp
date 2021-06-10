import 'package:flutter/material.dart';
import 'package:legendary_app/LegendaInterface.dart';

class LegendaCard extends StatelessWidget {

  // final String legenda;
  // final String titulo;
  // final bool categoria;
  // final bool favorito;

  // LegendaCard({
  //     this.legenda = "",
  //     this.titulo = "",
  //     this.categoria = true,
  //     this.favorito = false,
  //     required this.onFavorite
  // });

  final Function(bool) onFavorite;
  final List<LegendaInterface> legendas;

  LegendaCard({Key? key, required this.legendas, required this.onFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: legendas.length,
          itemBuilder: (context, index){
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
                        child: legendas[index].categoria
                            ? Icon(
                          Icons.music_note,
                          size: 30,
                          color: Colors.white,
                        )
                            : Icon(
                          Icons.menu_book_rounded,
                          size: 30,
                          color: Colors.white,
                        )
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                          legendas[index].legenda,
                                          style: TextStyle(
                                              color: Colors.black
                                          )),
                                      Padding(padding: EdgeInsets.only(top: 10)),
                                      Text(
                                          legendas[index].titulo,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )),
                                    ],
                                  )
                              )
                          ),
                          IconButton(
                              icon: legendas[index].favorito
                                  ? Icon(Icons.favorite, size: 30)
                                  : Icon(Icons.favorite_border, size: 30),
                              color: Colors.white,
                              onPressed: () {
                                onFavorite(legendas[index].favorito);
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
