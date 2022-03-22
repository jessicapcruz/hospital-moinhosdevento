import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  String _name = "";
  int _idPaciente = 0;

  String get name {
    return _name;
  }

  int get idPaciente {
    return _idPaciente;
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setIdUsuario(int idUsuario) {
    _idPaciente = idUsuario;
    notifyListeners();
  }
}