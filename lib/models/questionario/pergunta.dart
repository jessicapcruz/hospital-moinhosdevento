import 'dart:convert';

import 'package:hospitalmoinhosdevento/models/questionario/resposta.dart';

class Pergunta {
  final int perguntaNID;
  final int perguntaCTR;
  final int perguntaSEQ;
  final int perguntaSIM;
  final int perguntaNAO;
  final String perguntaDES;
  final String perguntaTIP;
  final String perguntaPS1;
  final String perguntaPS2;
  final List<Resposta> respostas;


  Pergunta({
    required this.perguntaNID,
    required this.perguntaCTR,
    required this.perguntaSEQ,
    required this.perguntaSIM,
    required this.perguntaNAO,
    required this.perguntaDES,
    required this.perguntaTIP,
    required this.perguntaPS1,
    required this.perguntaPS2,
    required this.respostas
  });


  //JSON serialization
  factory Pergunta.fromRawJson(String str) => Pergunta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pergunta.fromJson(Map<String, dynamic> json) => Pergunta(
      perguntaNID: json['perguntaNID'] as int,
      perguntaCTR: json['perguntaCTR'] as int,
      perguntaSEQ: json['perguntaSEQ'] as int,
      perguntaSIM: json['perguntaSIM'] as int,
      perguntaNAO: json['perguntaNAO'] as int,
      perguntaDES: json['perguntaDES'] as String,
      perguntaTIP: json['perguntaTIP'] as String,
      perguntaPS1: json['perguntaPS1'] as String,
      perguntaPS2: json['perguntaPS2'] as String,
      respostas: json['respostas'] as List<Resposta>
  );

  Map<String, dynamic> toJson() => {
    "perguntaNID": perguntaNID,
    "perguntaCTR": perguntaCTR,
    "perguntaSEQ": perguntaSEQ,
    "perguntaSIM": perguntaSIM,
    "perguntaNAO": perguntaNAO,
    "perguntaDES": perguntaDES,
    "perguntaTIP": perguntaTIP,
    "perguntaPS1": perguntaPS1,
    "perguntaPS2": perguntaPS2,
    "respostas":respostas
  };

  Map toMap() {
    var map = new Map();
    map["perguntaNID"] = perguntaNID;
    map["perguntaCTR"] = perguntaCTR;
    map["perguntaSEQ"] = perguntaSEQ;
    map["perguntaSIM"] = perguntaSIM;
    map["perguntaNAO"] = perguntaNAO;
    map["perguntaDES"] = perguntaDES;
    map["perguntaTIP"] = perguntaTIP;
    map["perguntaPS1"] = perguntaPS1;
    map["perguntaPS2"] = perguntaPS2;
    map["respostas"] = respostas;

    return map;
  }
}