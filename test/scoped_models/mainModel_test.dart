// Import the test package and Counter class
import 'package:hospitalmoinhosdevento/scoped_models/main.dart';
import 'package:test/test.dart';

void main() {
  test('Atualiza ID paciente', () {
    final main = MainModel();

    main.setIdUsuario(1);

    expect(main.idPaciente, 1);
  });

  test('Atualiza Nome paciente', () {
    final main = MainModel();

    main.setName('teste');

    expect(main.name, 'teste');
  });

  test('Atualiza Questao', () {
    final main = MainModel();

    main.setnQuestao(2);

    expect(main.nQuestao, 2);
  });

  test('Atualiza Peso', () {
    final main = MainModel();

    main.setnPeso(2);

    expect(main.nPeso, 2);
  });

}