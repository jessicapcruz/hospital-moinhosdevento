//importing HTTP package for fetching and consuming HTTP resources
import 'dart:convert';

import 'package:hospitalmoinhosdevento/models/user/paciente.dart';
import 'package:http/http.dart' as http;

//Github request class
class PacienteRequest {
  final int? idUsuario;
  final String url = 'http://challengefiapapipaciente-env.eba-gnakevwh.sa-east-1.elasticbeanstalk.com/';
  //final String url = 'http://jsonplaceholder.typicode.com/users/1';

  static String clientId = 'CLIENT_ID'; //enter yout client id
  static String clientSecret = 'CLIENT_SECRET'; // insert your client secret
  String ? body = null;

  PacienteRequest(this.idUsuario);

  Future<Paciente> getPaciente() async {
    final response =
    //await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users/1'));
    await http.get(Uri.parse(url + 'pacientes/' + idUsuario.toString()));
    if (response.statusCode == 200) {
      return Paciente.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load paciente');
    }
  }

  Future createPost({required Map body}) async {
    return http.post(Uri.parse(url), body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return Paciente.fromJson(json.decode(response.body));
    });
  }

  Future<void> updatePaciente(Paciente paciente) async {
    await http.patch(
      Uri.parse(url + 'pacientes/' +  idUsuario.toString()),
      body: json.encode({
        "nome_completo": paciente.nome_completo,
        "data_nascimento": paciente.data_nascimento,
        "nome_mae": paciente.nome_mae,
        "cpf": paciente.cpf,
        "endereco": paciente.endereco,
        "telefone": paciente.telefone,
        "email": paciente.email
      }),headers: {
      "Accept": "application/json",
      "content-type":"application/json"
    }
    ).then((response) {
      if (response.statusCode < 200 || response.statusCode  > 400 ) {
        throw new Exception("ocorreu erro ao gravar alteração");
      }
    });
  }

}