import 'package:flutter/material.dart';
import 'package:legendary_app/res/RouteGenerator.dart';
import 'package:legendary_app/res/custom_colors.dart';
import 'package:legendary_app/usercase/LegendaInterface.dart';
import 'package:legendary_app/widgets.dart';

import '../FavoritosControl.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  LegendaCardController _controller = LegendaCardController();

  Future<Iterable<LegendaInterface>> get items {
    Future<Iterable<LegendaInterface>> result;
    result = _controller.getAll();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'FAVORITOS',
          style: TextStyle(
            color: Colors.purple,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.purple),
          onPressed: () => Navigator.pushReplacementNamed(
              context, RouteGenerator.ROTA_CADASTRARIMAGEM),
        ),
      ),
      body: FutureBuilder(
          future: items,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return buildError(context);
            }

            if (snapshot.connectionState == ConnectionState.done) {
              var favoritos = snapshot.data;
              if (favoritos.length > 0) {
                return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: favoritos.length,
                    itemBuilder: (BuildContext _context, int i) {
                      return _buildLegendaCard(context, favoritos.elementAt(i));
                    });
              } else {
                return noData(context);
              }
            }

            return buildLoading(context, CustomColors.lightPurple,
                Colors.purple, CustomColors.white);
          }),
    );
  }

  Widget _buildLegendaCard(BuildContext context, LegendaInterface favorito) {
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
                child: favorito.categoria
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
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 166,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SelectableText(favorito.trecho,
                                    style: TextStyle(color: Colors.black)),
                                Padding(padding: EdgeInsets.only(top: 15)),
                                SelectableText(
                                    (favorito.artista + ", " + favorito.obra),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: favorito.favorito
                          ? Icon(Icons.favorite, size: 30)
                          : Icon(Icons.favorite_border, size: 30),
                      color: Colors.white,
                      onPressed: () async {
                        return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirmação"),
                              content: const Text(
                                  "Tem certeza que deseja deletar esse item?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      bool tela_legenda = false;
                                      _controller.delete(
                                          favorito, tela_legenda);
                                      Navigator.of(context).pop(true);
                                    });
                                  },
                                  child: const Text(
                                    "Sim",
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text(
                                    "Não",
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
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
