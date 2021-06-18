import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:legendary_app/widgets/LegendaCard.dart';

class LegendaCardController {
  CollectionReference<Map<String, dynamic>>? _favoritos;

  LegendaCardController() {
    _initFavoritos();
  }

  void _initFavoritos() {
    _favoritos = FirebaseFirestore.instance.collection('favoritos');
  }

  LegendaCard _createWordPair(DocumentSnapshot<Map<String, dynamic>> e) {
    LegendaCard result = LegendaCard.fromJson(e.data()!);
    result.id = e.id;
    return result;
  }

  Future<Iterable<LegendaCard>> getAll() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _favoritos!.get();
    return snapshot.docs.map((e) => _createWordPair(e));
  }

  Future<LegendaCard> getById(String id) async {
    //if (id == null) return null;

    DocumentSnapshot<Map<String, dynamic>> doc =
        await _favoritos!.doc(id).get();
    return _createWordPair(doc);
  }

  Future save(LegendaCard legenda) async {
    if (legenda.id == null) {
      return _favoritos!.add(legenda.toJson());
    } else {
      return _favoritos!.doc(legenda.id).update(legenda.toJson());
    }
  }

  Future delete(LegendaCard wordPair) {
    return _favoritos!.doc(wordPair.id).delete();
  }
}
