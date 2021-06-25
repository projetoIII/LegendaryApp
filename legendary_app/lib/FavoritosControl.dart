import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:legendary_app/usercase/LegendaInterface.dart';

class LegendaCardController {
  List firebase_id = [];
  List colab_id = [];
  CollectionReference<Map<String, dynamic>>? _favoritos;

  LegendaCardController() {
    _initFavoritos();
  }

  void _initFavoritos() {
    _favoritos = FirebaseFirestore.instance.collection('favoritos');
  }

  LegendaInterface _createFavoritos(DocumentSnapshot<Map<String, dynamic>> e) {
    LegendaInterface result = LegendaInterface.fromJson(e.data()!);
    result.id = e.id;
    return result;
  }

  Future<Iterable<LegendaInterface>> getAll() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _favoritos!.get();
    return snapshot.docs.map((e) => _createFavoritos(e));
  }

  Future<LegendaInterface> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await _favoritos!.doc(id).get();
    return _createFavoritos(doc);
  }

  Future save(LegendaInterface legenda) async {
    DocumentReference favorito_add = await FirebaseFirestore.instance
        .collection('favoritos')
        .add(legenda.toJson());
    colab_id.add(legenda.id);
    firebase_id.add(favorito_add.id);
    print(colab_id);
    print(firebase_id);
    return favorito_add;
  }

  Future delete(LegendaInterface legenda) {
    colab_id.indexOf(legenda.id);
    var id = firebase_id[colab_id.indexOf(legenda.id)];
    return _favoritos!.doc(id).delete();
  }
}
