class LegendaInterface {

  final String trecho;
  final String artista;
  final String musica;
  final bool categoria;
  // final bool favorito;

  LegendaInterface({
    required this.trecho,
    required this.artista,
    required this.musica,
    required this.categoria,
    // required this.favorito,
  });

  factory LegendaInterface.fromJson(Map<String, dynamic> json) {
    return LegendaInterface(
      trecho: json['trecho'] as String,
      artista: json['artista'] as String,
      musica: json['musica'] as String,
      categoria: json['categoria'] as bool,
      // favorito: json['favorito'] as bool,
    );
  }
}