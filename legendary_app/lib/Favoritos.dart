class Favoritos {
  late String id;
  late String artista;
  late String trecho;
  late bool favorito;

  Favoritos({
    this.id = '',
    this.artista = '',
    this.trecho = '',
    this.favorito = false,
  });

  Favoritos.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    artista = json['artista'];
    trecho = json['trecho'];
    favorito = json['favorito'];
  }

  Map<String, dynamic> toJson() => {
        'artista': artista,
        'trecho': trecho,
        'favorito': favorito,
      };
}
