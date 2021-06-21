import 'package:flutter/material.dart';
import 'package:legendary_app/LegendaInterface.dart';


class LegendaCard extends StatefulWidget {

  final List<LegendaInterface> legendas;

  LegendaCard({
    Key? key,
    required this.legendas
  }) : super(key: key);

  @override
  _LegendaCardState createState() => _LegendaCardState();
}

class _LegendaCardState extends State<LegendaCard> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.legendas.length,
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
                      child: widget.legendas[index].categoria
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
                            height: 166,
                            child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        widget.legendas[index].trecho,
                                        style: TextStyle(
                                            color: Colors.black
                                        )),
                                    Padding(padding: EdgeInsets.only(top: 10)),
                                    Text(
                                        (widget.legendas[index].artista + ", " + widget.legendas[index].obra),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        )),
                                  ],
                                )
                            )
                        ),
                        IconButton(
                            icon: widget.legendas[index].favorito
                                ? Icon(Icons.favorite, size: 30)
                                : Icon(Icons.favorite_border, size: 30),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                bool fav = widget.legendas[index].favorito;
                                widget.legendas[index].favorito = !fav;
                              });
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
