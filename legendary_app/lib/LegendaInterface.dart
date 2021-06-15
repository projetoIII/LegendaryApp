class LegendaInterface {

  final String trecho;
  final String artista;
  final String musica;
  final bool categoria;

  LegendaInterface({
    required this.trecho,
    required this.artista,
    required this.musica,
    required this.categoria,
  });

  factory LegendaInterface.fromJson(Map<String, dynamic> json) {
    return LegendaInterface(
      trecho: json['trecho'] as String,
      artista: json['artista'] as String,
      musica: json['musica'] as String,
      categoria: json['categoria'] as bool,
    );
  }
}