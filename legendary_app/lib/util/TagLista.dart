import 'package:flutter/material.dart';

class TagLista extends ChangeNotifier{

  List<String> _tagList = ['superman', 'sweetheart', 'teste1', 'teste2'];

  List<String> get getList =>
      this._tagList;

  set tagList(String value) {
    _tagList.add(value);
    notifyListeners();
  }

}