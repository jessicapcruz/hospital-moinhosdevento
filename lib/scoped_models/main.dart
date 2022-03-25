

import 'package:flutter/material.dart';
import 'package:hospitalmoinhosdevento/pages/login/login.page.dart';
import 'package:hospitalmoinhosdevento/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  String _name = "";
  int _idPaciente = 0;
  int _nQuestao = 2;
  double _nPeso = 0;


  String get name {
    return _name;
  }

  int get idPaciente {
    return _idPaciente;
  }

  int get nQuestao {
    return _nQuestao;
  }

  double get nPeso {
    return _nPeso;
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setIdUsuario(int idUsuario) {
    _idPaciente = idUsuario;
    notifyListeners();
  }

  void setnQuestao(int nQuestao) {
    _nQuestao = nQuestao;
    notifyListeners();
  }

  void set nQuestao(int nQuestao) {
    _nQuestao = nQuestao;
    notifyListeners();
  }

  void setnPeso(double nPeso) {
    _nPeso = nPeso;
    notifyListeners();
  }

  void incrementanQuestao() {
    nQuestao = nQuestao + 1;
    notifyListeners();
  }
}