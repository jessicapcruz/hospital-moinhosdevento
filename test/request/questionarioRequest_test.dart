import 'package:flutter_test/flutter_test.dart';
import 'package:hospitalmoinhosdevento/requests/questionario/questionarioRequest.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main() {
  group('Método getQuestionario', () {
    test('Quando retorno com erro, retorna questionario vazio',
            () async {
          // Arrange
          final client = MockClient((request) async {
            return Response('', 404);
          });
          final questionarioClient = QuestionarioRequest(1,1,1);
          Map<String, String> body = Map<String, String>();
          final result = await questionarioClient.getPergunta(body);
          // Assert
          expect(result != null, true);
        });
  });
}