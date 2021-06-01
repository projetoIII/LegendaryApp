import 'package:flutter/material.dart';
import 'package:legendary_app/CarregarImagem.dart';
import 'package:legendary_app/Home.dart';

class RouteGenerator {
  /// Adicionar aqui uma constante com o nome da sua rota, como no exemplo abaixo
  /// E adicionar um novo CASE no switch mais abaixo
  static const String ROTA_HOME = "/home";
  static const String ROTA_CADASTRARIMAGEM = "/carregarimagem";

  /// E quando for mudar de branch, seguir o modelo abaixo
  // Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_HOME)

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROTA_HOME:
        return MaterialPageRoute(builder: (_) => HomePageView());

      case ROTA_CADASTRARIMAGEM:
        return MaterialPageRoute(builder: (_) => UploadImagePage());

      default:
        return MaterialPageRoute(builder: (_) => HomePageView());
    }
  }
}
