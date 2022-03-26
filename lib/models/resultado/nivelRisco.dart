import 'dart:convert';

import 'package:hospitalmoinhosdevento/models/questionario/resposta.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class NivelRisco {
  final int faixaDe;
  final int faixaAte;
  final int tempoEspera;
  final String descricao;

  NivelRisco({
    required this.faixaDe,
    required this.faixaAte,
    required this.tempoEspera,
    required this.descricao,
  });


  //JSON serialization
  factory NivelRisco.fromRawJson(String str) => NivelRisco.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NivelRisco.fromJson(Map<String, dynamic> json) => NivelRisco(
      faixaDe: json['faixaDe'] as int,
      faixaAte: json['faixaAte'] as int,
      tempoEspera: json['tempoEspera'] as int,
      descricao: json['descricao'] as String,
  );

  Map<String, dynamic> toJson() => {
    "faixaDe": faixaDe,
    "faixaAte": faixaAte,
    "tempoEspera": tempoEspera,
    "descricao": descricao,
  };

  Map toMap() {
    var map = new Map();
    map["faixaDe"] = faixaDe;
    map["faixaAte"] = faixaAte;
    map["tempoEspera"] = tempoEspera;
    map["descricao"] = descricao;
    return map;
  }
}