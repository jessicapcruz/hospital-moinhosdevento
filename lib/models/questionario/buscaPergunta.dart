import 'dart:convert';

class BuscaPergunta {
  final int idPergunta;
  final int idRespota;
  final int idPaciente;
  final String dataEnvio;

  BuscaPergunta({
    required this.idPergunta,
    required this.idRespota,
    required this.idPaciente,
    required this.dataEnvio,
  });

  //JSON serialization
  factory BuscaPergunta.fromRawJson(String str) => BuscaPergunta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BuscaPergunta.fromJson(Map<String, dynamic> json) => BuscaPergunta(
      idPergunta: json['idPergunta'] as int,
      idRespota: json['idRespota'] as int,
      idPaciente: json['idPaciente'] as int,
      dataEnvio: json['dataEnvio'] as String,
  );

  Map<String, dynamic> toJson() => {
    "idPergunta": idPergunta,
    "idRespota": idRespota,
    "idPaciente": idPaciente,
    "dataEnvio": dataEnvio
  };

  Map toMap() {
    var map = new Map();
    map["idPergunta"] = idPergunta;
    map["idRespota"] = idRespota;
    map["idPaciente"] = idPaciente;
    map["dataEnvio"] = dataEnvio;

    return map;
  }
}