import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:legendary_app/usercase/LegendaInterface.dart';

class LegendaCardController {
  List firebase_id = [];
  List colab_id = [];
  CollectionReference<Map<String, dynamic>>? _favoritos;
  final FirebaseAuth auth = FirebaseAuth.instance;

  LegendaCardController() {
    _initFavoritos();
  }

  void _initFavoritos() async {
    User? _user = auth.currentUser;
    if (_user != null) {
      print('AQUI');
      final userId = _user.uid;
      _favoritos = FirebaseFirestore.instance
          .collection('usuarios')
          .doc(userId)
          .collection('favoritos');
    } else {
      _favoritos = FirebaseFirestore.instance.collection('favoritos');
    }
  }

  getUser() {
    User? user = auth.currentUser;
    if (user != null) {
      return user.uid;
    }
    return null;
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
    User? _user = auth.currentUser;
    DocumentReference favorito_add = await FirebaseFirestore.instance
        .collection('favoritos')
        .add(legenda.toJson());
    if (_user != null) {
      favorito_add = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc()
          .collection('favoritos')
          .add(legenda.toJson());
    }
    colab_id.add(legenda.id);
    firebase_id.add(favorito_add.id);
    print(colab_id);
    print(firebase_id);
    return favorito_add;
  }

  Future delete(LegendaInterface legenda, bool tela_legendas) {
    if (tela_legendas == true) {
      colab_id.indexOf(legenda.id);
      var id = firebase_id[colab_id.indexOf(legenda.id)];
      int index = colab_id.indexOf(legenda.id);
      colab_id.removeAt(index);
      firebase_id.removeAt(index);
      return _favoritos!.doc(id).delete();
    }

    return _favoritos!.doc(legenda.id).delete();
  }
}
