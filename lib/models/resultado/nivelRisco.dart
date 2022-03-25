import 'dart:convert';

import 'package:hospitalmoinhosdevento/models/questionario/resposta.dart';

import '../retorno/retorno.dart';

class NivelRisco {
  final int faixaDe;
  final int faixaAte;
  final int tempoEspera;
  final String descricao;
  final Retorno retorno;

  NivelRisco({
    required this.faixaDe,
    required this.faixaAte,
    required this.tempoEspera,
    required this.descricao,
    required this.retorno,
  });


  //JSON serialization
  factory NivelRisco.fromRawJson(String str) => NivelRisco.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NivelRisco.fromJson(Map<String, dynamic> json) => NivelRisco(
      faixaDe: json['faixaDe'] as int,
      faixaAte: json['faixaAte'] as int,
      tempoEspera: json['tempoEspera'] as int,
      descricao: json['descricao'] as String,
      retorno: json['retorno'] as Retorno,
  );

  Map<String, dynamic> toJson() => {
    "faixaDe": faixaDe,
    "faixaAte": faixaAte,
    "tempoEspera": tempoEspera,
    "descricao": descricao,
    "retorno": retorno,
  };

  Map toMap() {
    var map = new Map();
    map["faixaDe"] = faixaDe;
    map["faixaAte"] = faixaAte;
    map["tempoEspera"] = tempoEspera;
    map["descricao"] = descricao;
    map["retorno"] = retorno;
    return map;
  }
}