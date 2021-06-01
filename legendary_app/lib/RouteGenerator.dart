import 'package:flutter/material.dart';
import 'package:legendary_app/Home.dart';
import 'package:legendary_app/Legendas.dart';

class RouteGenerator {

  /// Adicionar aqui uma constante com o nome da sua rota, como no exemplo abaixo
  /// E adicionar um novo CASE no switch mais abaixo
  static const String ROTA_HOME = "/home";
  static const String ROTA_LEGENDAS = "/legendas";

  /// E quando for mudar de branch, seguir o modelo abaixo
  // Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_HOME)

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name){
      case ROTA_HOME:
        return MaterialPageRoute(
            builder: (_) => HomePageView()
        );
      case ROTA_LEGENDAS:
        return MaterialPageRoute(
            builder: (_) => LegendasView()
        );
      default:
        return MaterialPageRoute(
            builder: (_) => HomePageView()
        );
    }

  }

}