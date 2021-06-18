import 'package:flutter/material.dart';

class TagLista {

  final List<String> _tagList;

  List<String> get tagList =>
      this._tagList;

  TagLista(this._tagList);

}

// }class TagLista extends ChangeNotifier{
//
//   List<String> _tagList = ['superman', 'sweetheart', 'teste1'];
//
//   List<String> get tagList =>
//       this._tagList;
//
//   void add(String value) {
//     _tagList.add(value);
//     notifyListeners();
//   }
//
// }