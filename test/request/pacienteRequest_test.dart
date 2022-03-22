import 'package:flutter_test/flutter_test.dart';
import 'package:hospitalmoinhosdevento/requests/paciente/pacienteRequest.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main() {
  group('Método getPaciente', () {
    test('Quando retorno com erro, retorna paciente vazio',
            () async {
          // Arrange
          final client = MockClient((request) async {
            return Response('', 404);
          });
          final pacienteClient = PacienteRequest(1);
          final result = await pacienteClient.getPaciente();
          // Assert
          expect(result != null, true);
        });

    test('Quando retorno com sucesso, retorna paciente',
            () async {
          // Arrange
          final client = MockClient((request) async {
            return Response(
                '{"id": 1, "nome_completo": "nome_completo", "nome_mae": "mock", "cpf": "cpf","endereco":"endereco","telefone":"telefone", "email":"email"}',
                200);
          });
          final pacienteClient = PacienteRequest(1);
          // Act
          final result = await pacienteClient.getPaciente();

          // Assert
          expect(result !=null, true);
        });
  });
}