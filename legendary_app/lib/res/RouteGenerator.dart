import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:legendary_app/model/TagLista.dart';
import 'package:legendary_app/view/Cadastrar.dart';
import 'package:legendary_app/view/CarregarImagem.dart';
import 'package:legendary_app/view/EditarPerfil.dart';
import 'package:legendary_app/view/Entrar.dart';
import 'package:legendary_app/view/Favoritos.dart';
import 'package:legendary_app/view/Home.dart';
import 'package:legendary_app/view/InputURL.dart';
import 'package:legendary_app/view/Legendas.dart';

class RouteGenerator {
  static const String ROTA_HOME = "/home";
  static const String ROTA_LEGENDAS = "/legendas";
  static const String ROTA_ENTRADA = "/entrar";
  static const String ROTA_CADASTRO = "/cadastrar";
  static const String ROTA_CADASTRARIMAGEM = "/carregarimagem";
  static const String ROTA_EDITARPERFIL = "/editarperfil";
  static const String ROTA_FAVORITOS = "/favoritos";
  static const String ROTA_URL = "/url";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROTA_HOME:
        return MaterialPageRoute(builder: (_) => HomePageView());
      case ROTA_LEGENDAS:
        final args = settings.arguments as TagLista;
        return MaterialPageRoute(builder: (_) => LegendasView(args.tagList));
      case ROTA_ENTRADA:
        return MaterialPageRoute(builder: (_) => EntrarPageView());
      case ROTA_CADASTRO:
        return MaterialPageRoute(builder: (_) => CadastrarPageView());
      case ROTA_CADASTRARIMAGEM:
        return MaterialPageRoute(builder: (_) => UploadImagePage());
      case ROTA_EDITARPERFIL:
        return MaterialPageRoute(builder: (_) => EditarPerfilPageView());
      case ROTA_FAVORITOS:
        return MaterialPageRoute(builder: (_) => FavoritesPage());
      case ROTA_URL:
        return MaterialPageRoute(builder: (_) => InputURL());
      default:
        return MaterialPageRoute(builder: (_) => HomePageView());
    }
  }
}
