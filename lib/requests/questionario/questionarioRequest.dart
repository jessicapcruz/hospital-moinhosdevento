//importing HTTP package for fetching and consuming HTTP resources
import 'dart:convert';

import 'package:hospitalmoinhosdevento/models/user/paciente.dart';
import 'package:http/http.dart' as http;

import '../../models/questionario/pergunta.dart';
//Github request class
class QuestionarioRequest {
  final int idPaciente; // usernaname
  final int idPergunta;
  final int idReposta;
  final String dataEnvio;
  final double pesoResposta;
  final int idSocorrista = 0;
  final String url = 'http://challengefiapquestionarioacessoapi-env.eba-kedv2ypx.sa-east-1.elasticbeanstalk.com/';

  //final String url = 'http://jsonplaceholder.typicode.com/users/1';

  static String clientId = 'CLIENT_ID'; //enter yout client id
  static String clientSecret = 'CLIENT_SECRET'; // insert your client secret
  String ? body = null;

  QuestionarioRequest(this.idPaciente, this.idPergunta, this.idReposta, this.dataEnvio, this.pesoResposta);

  //Fetch a user with the username supplied in the form input
  Future<http.Response> fetchUser() {
    return http.get(Uri.parse(url + 'users/'));
  }
  Future<List<Pergunta>> fetchPost() async {
    final response =
    await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users/1'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Paciente>((json) => Pergunta.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Pergunta> getPergunta() async {

    final response =
    await http.post(Uri.parse(url + 'questionario/enviar'),
        body:  json.encode({
          "pacienteID": idPaciente,
          "dataEnvio": "2022-03-24",
          "perguntaID": idPergunta,
          "respostaID":idReposta,
          "respostaPeso": pesoResposta,
        }),headers: {
          "Accept": "application/json",
          "content-type":"application/json"
        }
    );

    if (response.statusCode == 200) {
      return Pergunta.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load pergunta');
    }
  }

  Future<Pergunta> obterResultado() async {

    final response =
    await http.post(Uri.parse(url + 'obter/resultado'),
        body:  json.encode({
          {
            "pacienteID": idPaciente,
            "socorristaID": idSocorrista,
            "dataEnvio": dataEnvio
          }
        }),headers: {
          "Accept": "application/json",
          "content-type":"application/json"
        }
    );

    if (response.statusCode == 200) {
      return Pergunta.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load pergunta');
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
}