import 'package:flutter/material.dart';
import 'package:legendary_app/LegendaInterface.dart';

class LegendaCard extends StatelessWidget {

  final bool favorito;
  final Function(bool) onFavorite;
  final List<LegendaInterface> legendas;

  LegendaCard({
    Key? key,
    required this.legendas,
    this.favorito = false,
    required this.onFavorite
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
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
                              height: 163,
                              child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          legendas[index].trecho,
                                          style: TextStyle(
                                              color: Colors.black
                                          )),
                                      Padding(padding: EdgeInsets.only(top: 10)),
                                      Text(
                                          (legendas[index].artista + ", " + legendas[index].musica),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )),
                                    ],
                                  )
                              )
                          ),
                          IconButton(
                              icon: this.favorito
                                  ? Icon(Icons.favorite, size: 30)
                                  : Icon(Icons.favorite_border, size: 30),
                              color: Colors.white,
                              onPressed: () {
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
      );
  }
}
