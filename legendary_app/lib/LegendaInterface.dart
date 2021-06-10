class LegendaInterface {

  final String legenda;
  final String titulo;
  final bool categoria;
  // final bool favorito;

  LegendaInterface({
    required this.legenda,
    required this.titulo,
    required this.categoria,
    // required this.favorito,
  });

  factory LegendaInterface.fromJson(Map<String, dynamic> json) {
    return LegendaInterface(
      legenda: json['legenda'] as String,
      titulo: json['titulo'] as String,
      categoria: json['categoria'] as bool,
      // favorito: json['favorito'] as bool,
    );
  }
}