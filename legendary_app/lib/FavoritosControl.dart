import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'Favoritos.dart';

class LegendaCardController {
  CollectionReference<Map<String, dynamic>>? _favoritos;

  LegendaCardController() {
    _initFavoritos();
  }

  void _initFavoritos() {
    _favoritos = FirebaseFirestore.instance.collection('favoritos');
  }

  Favoritos _createFavoritos(DocumentSnapshot<Map<String, dynamic>> e) {
    Favoritos result = Favoritos.fromJson(e.data()!);
    result.id = e.id;
    return result;
  }

  Future<Iterable<Favoritos>> getAll() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _favoritos!.get();
    return snapshot.docs.map((e) => _createFavoritos(e));
  }

  Future<Favoritos> getById(String id) async {
    //if (id == null) return null;

    DocumentSnapshot<Map<String, dynamic>> doc =
        await _favoritos!.doc(id).get();
    return _createFavoritos(doc);
  }

  Future save(Favoritos legenda) async {
    return _favoritos?.add(legenda.toJson());
  }

  Future delete(Favoritos legenda) {
    return _favoritos!.doc(legenda.id).delete();
  }
}
