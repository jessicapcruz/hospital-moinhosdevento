// Import the test package and Counter class
import 'package:hospitalmoinhosdevento/models/user/paciente.dart';
import 'package:hospitalmoinhosdevento/providers/UserProvider.dart';
import 'package:test/test.dart';

void main() {
  test('Atualiza loading', () {
    final main = UserProvider();

    main.setLoading(true);

    expect(main.loading, true);
  });

  test('Atualiza mensagem', () {
    final main = UserProvider();

    main.setMessage('teste');

    expect(main.getMessage(), 'teste');
  });

  test('Atualiza paciente', () {
    final main = UserProvider();
    Paciente paciente = Paciente(id: 1,
        nome_completo: 'nome',
        nome_mae: 'nome_mae',
        cpf: 'cpf',
        endereco: 'endereco',
        telefone: 'telefone',
        email: 'email');

    main.setUser(paciente);

    expect(main.getUser().nome_completo, 'nome');
  });
}