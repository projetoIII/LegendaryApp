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

 _dialogLegenda(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(
                Radius.circular(10.0))),
        content: Builder(
          builder: (context) {
            // Get available height and width of the build area of this widget. Make a choice depending on the size.
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;

            return Container(
              height: height - 300,
              width: width + 500,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey,
                          child: ClipOval(
                            child: new SizedBox(
                              width: 170.0,
                              height: 170.0,
                              child: Image.network(
                                "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      Text("  "),
                      Text('Andrew Aquino',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0)
                      ),
                    ],
                  ),
                  new Expanded(
                    child: Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width * 0.67,
                          height: MediaQuery.of(context).size.width * 0.67,
                        ),
                      ),
                    ],
                  ),
                  new Expanded(
                    child: Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container (
                          padding: const EdgeInsets.all(16.0),
                          width: MediaQuery.of(context).size.width*0.65,
                          child: new Column (
                            children: <Widget>[
                              new Text ("“Let the sun illuminate the word that you could not find” - ",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black
                                  ) ),
                              new Text ("Unwritten, Natasha Bedingfield",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ) ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ],
              ),
            );
          },
        ),
      )

  );
}
