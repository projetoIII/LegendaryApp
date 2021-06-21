class LegendaInterface {

  final String trecho;
  final String artista;
  final String obra;
  final bool categoria;
  bool favorito;

  LegendaInterface({
    required this.trecho,
    required this.artista,
    required this.obra,
    required this.categoria,
    this.favorito = false,
  });

  factory LegendaInterface.fromJson(Map<String, dynamic> json) {
    return LegendaInterface(
      trecho: json['trecho'] as String,
      artista: json['artista'] as String,
      obra: json['obra'] as String,
      categoria: json['categoria'] as bool,
      favorito: json['favorito'] as bool,
    );
  }
}