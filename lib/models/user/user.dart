import 'dart:convert';

class User {
  final int id;
  final String nome_completo;
  final String nome_mae;
  final String cpf;
  final String endereco;
  final String telefone;
  final String email;

  User({
    required this.id,
    required this.nome_completo,
    required this.nome_mae,
    required this.cpf,
    required this.endereco,
    required this.telefone,
    required this.email,
  });
  //JSON serialization
  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int,
    nome_completo: json['nome_completo'] as String,
    nome_mae: json['nome_mae'] as String,
    cpf: json['cpf'] as String,
    endereco: json['endereco'] as String,
    telefone: json['telefone'] as String,
    email: json['email'] as String,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome_completo": nome_completo,
    "nome_mae": nome_mae,
    "cpf": cpf,
    "endereco": endereco,
    "telefone": telefone,
    "email": email
  };
}