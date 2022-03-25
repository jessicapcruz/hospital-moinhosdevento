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
          final questionarioClient = QuestionarioRequest(0,0,0, "", double.parse("0"));

          final result = await questionarioClient.getPergunta();
          // Assert
          expect(result != null, true);
        });
  });
}