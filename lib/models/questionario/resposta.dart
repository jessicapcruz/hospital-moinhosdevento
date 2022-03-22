import 'dart:convert';

class Resposta {
  final int idResposta;

  Resposta({
    required this.idResposta
  });

  //JSON serialization
  factory Resposta.fromRawJson(String str) => Resposta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Resposta.fromJson(Map<String, dynamic> json) => Resposta(
      idResposta: json['idResposta'] as int
  );

  Map<String, dynamic> toJson() => {
    "idResposta": idResposta
  };

  Map toMap() {
    var map = new Map();
    map["idResposta"] = idResposta;

    return map;
  }
}