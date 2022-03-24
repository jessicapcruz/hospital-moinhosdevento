import 'dart:convert';

class Paciente {
  final int?paciente_id;
  final String nome_completo;
  final String ? data_nascimento;
  final String nome_mae;
  final String cpf;
  final String endereco;
  final String telefone;
  final String email;

  Paciente({
    this.paciente_id,
    required this.nome_completo,
    this.data_nascimento,
    required this.nome_mae,
    required this.cpf,
    required this.endereco,
    required this.telefone,
    required this.email
  });


  //JSON serialization
  factory Paciente.fromRawJson(String str) => Paciente.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
    paciente_id: json['paciente_id'] as int,
    nome_completo: json['nome_completo'] as String,
    data_nascimento: json['data_nascimento'] as String,
    nome_mae: json['nome_mae'] as String,
    cpf: json['cpf'] as String,
    endereco: json['endereco'] as String,
    telefone: json['telefone'] as String,
    email: json['email'] as String
  );

  Map<String, dynamic> toJson() => {
    "paciente_id": paciente_id,
    "nome_completo": nome_completo,
    "data_nascimento":data_nascimento,
    "nome_mae": nome_mae,
    "cpf": cpf,
    "endereco": endereco,
    "telefone": telefone,
    "email": email
  };

  Map toMap() {
    var map = new Map();
    map["paciente_id"] = paciente_id;
    map["nome_completo"] = nome_completo;
    map["data_nascimento"] = data_nascimento;
    map["nome_mae"] = nome_mae;
    map["cpf"] = cpf;
    map["endereco"] = endereco;
    map["telefone"] = telefone;
    map["email"] = email;

    return map;
  }
}