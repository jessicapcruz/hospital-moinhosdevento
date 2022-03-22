import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../models/questionario/pergunta.dart';
import '../../models/user/paciente.dart';
import '../home/inicio.page.dart';
import '../profile/profile.page.dart';

class QuestionarioPage  extends StatefulWidget {
  //QuestionarioPage({Key? key, required this.idPaciente}) : super(key: key);
  //final int idPaciente;

  @override
  _QuestionarioPageState  createState() => _QuestionarioPageState ();
}


class _QuestionarioPageState extends State<QuestionarioPage> {
  late Paciente user; //instantiate a user
  late Future<Pergunta> pergunta;

  @override
  void initState() {
    super.initState();
    //pergunta = QuestionarioRequest('teste').fetchPost2();

  }

  @override
  Widget build(BuildContext context) {
      return Container(
          padding: EdgeInsets.all(5),
          child: const Text('* Este questionario tem o objetivo de avaliar o diagnostico prévio, com base em seus sintomas e inclui-lo na fila de atendimento.',
            textAlign: TextAlign.left,
          ),
      );
  }
}