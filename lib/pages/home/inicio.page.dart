import 'dart:js';

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
                        formularioEmergencia(context),
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


Widget formularioEmergencia (BuildContext context){
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
            builder: (context) => EmergenciaPage(showBottomNav: true),
          ),
        );
      },
      ),
      Text('Emergência')
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
        iconSize:80,           onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UnidadesPage(),
          ),
        );
      },
      ),
      Text('Unidades')
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
      Text('Pronto Atendimento')
    ],
  );
}


Widget profileItem(int idPaciente, String name) {
  return Container(
    padding: EdgeInsets.all(10.0),
    child: Center(
      child: Column(
        children: <Widget>[
          Image.asset("user-picture.png"),
          Text(name),
          Text(idPaciente.toString())
        ],
      ),
    ),
  );
}


