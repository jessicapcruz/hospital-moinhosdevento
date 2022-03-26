import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Retorno {
  final int codigo;
  final String mensagem;

  Retorno({
    required this.codigo,
    required this.mensagem,
  });


  //JSON serialization
  factory Retorno.fromRawJson(String str) => Retorno.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Retorno.fromJson(Map<String, dynamic> json) => Retorno(
    codigo: json['codigo'] as int,
    mensagem: json['mensagem'] as String,
  );

  Map<String, dynamic> toJson() => {
    "codigo": codigo,
    "mensagem": mensagem,
  };

  Map toMap() {
    var map = new Map();
    map["codigo"] = codigo;
    map["mensagem"] = mensagem;
    return map;
  }
}