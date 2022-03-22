//importing HTTP package for fetching and consuming HTTP resources
import 'dart:convert';

import 'package:hospitalmoinhosdevento/models/user/paciente.dart';
import 'package:http/http.dart' as http;

//Github request class
class PacienteRequest {
  final int idUsuario;
  //final String url = 'http://challenge-fiap-api-paciente.sa-east-1.elasticbeanstalk.com/';
  final String url = 'http://jsonplaceholder.typicode.com/users/1';

  static String clientId = 'CLIENT_ID'; //enter yout client id
  static String clientSecret = 'CLIENT_SECRET'; // insert your client secret
  String ? body = null;

  PacienteRequest(this.idUsuario);

  //Fetch a user with the username supplied in the form input
  Future<http.Response> fetchUser() {
    return http.get(Uri.parse(url + 'users/' + idUsuario.toString()));
  }
  Future<List<Paciente>> fetchPost() async {
    final response =
    await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users/1'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Paciente>((json) => Paciente.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Paciente> getPaciente() async {
    final response =
    await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users/1'));
    //await http.get(Uri.parse(url + 'paciente/' + idUsuario.toString()));
    if (response.statusCode == 200) {
      return Paciente.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load paciente');
    }
  }

  Future<http.Response> fetchPatients () {
    return http.get(Uri.parse(url));
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
}