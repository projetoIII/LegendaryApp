import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legendary_app/widgets/LegendaCard.dart';
import 'package:legendary_app/widgets/TagBusca.dart';

import 'FavoritosControl.dart';

class LegendasView extends StatefulWidget {
  @override
  _LegendasViewState createState() => _LegendasViewState();
}

class _LegendasViewState extends State<LegendasView> {
  List<String> _tags = ['sol', 'cachorro', 'sun', 'flor', 'oculos'];
  String _legenda = "Let the sun illuminate the word that you could not find";
  String _titulo = "Unwritten, Natasha Bedingfield";
  bool _categoria = true;
  bool _favorito = false;

  LegendaCardController _controller = LegendaCardController();
  late LegendaCard _legendacard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCE93D8),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('LEGENDAS'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TagBusca(
                  tags: _tags,
                ),
                LegendaCard(
                  legenda: _legenda,
                  titulo: _titulo,
                  categoria: _categoria,
                  favorito: _favorito,
                  onFavorite: (bool val) {
                    setState(() {
                      val = !val;
                      if (val == true) {
                        print('TESTE TRUE');
                        //_save(context);
                      } else if (val == false) {
                        print('TESTE FALSE');
                      }
                      _favorito = val;
                    });
                  },
                ),
                LegendaCard(
                  legenda: _legenda,
                  titulo: _titulo,
                  categoria: _categoria,
                  favorito: _favorito,
                  onFavorite: (bool val) {
                    setState(() {
                      val = !val;
                      if (val == true) {
                        print('TESTE TRUE');
                        //_save(context);
                      } else if (val == false) {
                        print('TESTE FALSE');
                      }
                      _favorito = val;
                    });
                  },
                ),
              ],
            ),
          )),
    );
  }

  void _save(BuildContext context) {
    _legendacard.titulo = _titulo;
    _legendacard.legenda = _legenda;
    _legendacard.favorito = _favorito;
    _controller.save(_legendacard);
  }

  void _delete(BuildContext context) {
    _controller.delete(_legendacard);
  }
}
