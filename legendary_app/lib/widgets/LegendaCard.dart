import 'package:flutter/material.dart';

class LegendaCard extends StatelessWidget {
  late String id;
  late String legenda;
  late String titulo;
  late bool categoria;
  late Function(bool) onFavorite;
  late bool favorito;

  LegendaCard(
      {this.legenda = "",
      this.titulo = "",
      this.categoria = true,
      this.favorito = false,
      required this.onFavorite});

  LegendaCard.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    titulo = json['titulo'];
    legenda = json['legenda'];
    favorito = json['favorito'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'legenda': legenda,
        'favorito': favorito,
      };

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
                child: this.categoria
                    ? Icon(
                        Icons.music_note,
                        size: 30,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.menu_book_rounded,
                        size: 30,
                        color: Colors.white,
                      )),
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
                              Text(this.legenda,
                                  style: TextStyle(color: Colors.black)),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text(this.titulo,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ))),
                  IconButton(
                      icon: this.favorito
                          ? Icon(Icons.favorite, size: 30)
                          : Icon(Icons.favorite_border, size: 30),
                      color: Colors.white,
                      onPressed: () {
                        print("fav aqui:");
                        print(this.favorito);
                        onFavorite(this.favorito);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
