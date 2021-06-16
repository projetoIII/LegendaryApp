import 'package:flutter/material.dart';

class TagLista extends ChangeNotifier{

  List<String> _tagList = ['superman', 'sweetheart', 'teste1', 'teste2'];

  List<String> get tagList =>
      this._tagList;

  void add(String value) {
    _tagList.add(value);
    notifyListeners();
  }

}