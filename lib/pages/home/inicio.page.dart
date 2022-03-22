import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hospitalmoinhosdevento/pages/atendimento/prontoAtendimento.page.dart';
import 'package:hospitalmoinhosdevento/pages/unidades/unidades.page.dart';

import '../emergencia/emergencia.page.dart';

class InicioPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,

        child: ListView(
          children: <Widget>[
            profileItem(),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:<Widget>[
                  formularioEmergencia (context),
                  unidades(context),
                  prontoAtendimento(context)
                ]
            ),
          ],
        ),
      ),
    );
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


Widget profileItem() {
  return Container(
    padding: EdgeInsets.all(10.0),
    child: Center(
      child: Column(
        children: <Widget>[
          Image.asset("user-picture.png"),
          Text('Nome do paciente'),
          Text('ID do paciente')
        ],
      ),
    ),
  );
}


