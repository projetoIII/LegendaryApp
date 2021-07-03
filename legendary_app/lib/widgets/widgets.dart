import 'package:flutter/material.dart';

Widget buildError(context) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Center(
      child: Text(
        'Erro ao carregar os dados do App.\n'
        'Tente novamente mais tarde.',
        style: TextStyle(
          color: Colors.purple,
          fontSize: 16.0,
        ),
      ),
    ),
  );
}

Widget buildLoading(
    context, Color colorText, Color ProgressBG, Color ProgressC) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ProgressBG),
          backgroundColor: ProgressC,
        ),
      ],
    ),
  );
}

Widget noData(context) {
  return Center(
    child: Text(
      'Você ainda não adicionou nenhuma \n música aos favoritos',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16.0,
      ),
    ),
  );
}
