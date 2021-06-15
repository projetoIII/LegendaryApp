import 'package:flutter/material.dart';
import 'package:legendary_app/CarregarImagem.dart';
import 'package:legendary_app/Home.dart';
import 'package:legendary_app/Legendas.dart';
import 'package:legendary_app/Cadastrar.dart';
import 'package:legendary_app/Entrar.dart';
import 'package:legendary_app/EditarPerfil.dart';

class RouteGenerator {
  /// Adicionar aqui uma constante com o nome da sua rota, como no exemplo abaixo
  /// E adicionar um novo CASE no switch mais abaixo
  static const String ROTA_HOME = "/home";
  static const String ROTA_LEGENDAS = "/legendas";
  static const String ROTA_ENTRADA = "/entrar";
  static const String ROTA_CADASTRO = "/cadastrar";
  static const String ROTA_CADASTRARIMAGEM = "/carregarimagem";
  static const String ROTA_EDITARPERFIL = "/editarperfil";

  /// E quando for mudar de branch, seguir o modelo abaixo
  // Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_HOME)

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROTA_HOME:
        return MaterialPageRoute(builder: (_) => HomePageView());
      case ROTA_LEGENDAS:
        return MaterialPageRoute(builder: (_) => LegendasView());
      case ROTA_ENTRADA:
        return MaterialPageRoute(builder: (_) => EntrarPageView());
      case ROTA_CADASTRO:
        return MaterialPageRoute(builder: (_) => CadastrarPageView());
        return MaterialPageRoute(builder: (_) => HomePageView());
      case ROTA_CADASTRARIMAGEM:
        return MaterialPageRoute(builder: (_) => UploadImagePage());
      case ROTA_EDITARPERFIL:
        return MaterialPageRoute(builder: (_) => EditarPerfilPageView());
      default:
        return MaterialPageRoute(builder: (_) => HomePageView());
    }
  }
}
