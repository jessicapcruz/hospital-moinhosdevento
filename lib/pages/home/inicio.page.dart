import 'package:flutter/material.dart';
import 'package:hospitalmoinhosdevento/pages/atendimento/prontoAtendimento.page.dart';
import 'package:hospitalmoinhosdevento/pages/unidades/unidades.page.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../scoped_models/main.dart';
import '../emergencia/emergencia.page.dart';

class InicioPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  profileItem(model.idPaciente, model.name),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        formularioEmergencia(context, model.idPaciente),
                        unidades(context),
                        //prontoAtendimento(context)
                      ]
                  ),
                ],
              ),
            ),
          );
    });
  }
}


Widget formularioEmergencia (BuildContext context, int idPaciente){
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      IconButton(
        icon: const Icon(Icons.assignment_outlined ),
        tooltip: 'Formulario de emergência',
        iconSize:80,
          onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmergenciaPage(showBottomNav: true, idPergunta: 0,idRespota: 0, idPaciente:idPaciente, dataEnvio:DateTime.now().toString(), peso: 0),
          ),
        );
      },
      ),
      const Text('Emergência')
    ],
  );
}

Widget unidades (BuildContext context){
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      IconButton(
        icon: const Icon(Icons.business_outlined ),
        tooltip: 'Unidades',
        iconSize:80,
        onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UnidadesPage(),
          ),
        );
      },
      ),
      const Text('Unidades')
    ],
  );
}

Widget prontoAtendimento (BuildContext context){
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      IconButton(
        icon: const Icon(Icons.business_outlined ),
        tooltip: 'Pronto Atendimento',
        iconSize:80,           onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProntoAtendimentoPage(),
          ),
        );
      },
      ),
      const Text('Pronto Atendimento')
    ],
  );
}


Widget profileItem(int idPaciente, String name) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    child: Center(
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/user-picture.png"),
          Text(name),
          Text(idPaciente.toString())
        ],
      ),
    ),
  );
}


