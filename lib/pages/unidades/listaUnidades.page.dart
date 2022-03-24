import 'package:flutter/material.dart';

class ListaUnidadesPage  extends StatefulWidget {
  const ListaUnidadesPage({Key? key}) : super(key: key);


  @override
  _ListaUnidadesPageState  createState() => _ListaUnidadesPageState ();
}

class _ListaUnidadesPageState extends State<ListaUnidadesPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(5),
      child: ListView(
          children: <Widget>[
            logoItem(),
            unidades(context),
        ]
      )


    );
  }

  Widget unidades (BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: const <Widget>[
        Text('Sede Moinhos de Vento',
        textAlign: TextAlign.left,),
        Text('(51) 3314-3434(Agendamento de consultas e exames',
            textAlign: TextAlign.left),
        Text('(51) 3314-3300(Para informações)',
            textAlign: TextAlign.left),
        Text('Entrada 1 - Rua Ramiro Barcelos, 910 -',
            textAlign: TextAlign.left),
        Text('Moinhos de Vento, Porto Alegre - RS, 90035-000',
            textAlign: TextAlign.left),
        Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 0,
          color: Colors.black,
        ),

        Text('Unidade Iguatemi',
          textAlign: TextAlign.left,),
        Text('(51) 3314-3434(Agendamento de consultas e exames)',
          textAlign: TextAlign.left,),
        Text('(51) 3314-3300(Para informações)',
          textAlign: TextAlign.left,),
        Text('Av. Antônio Carlos Berta, Shopping Iguatemi' ,
          textAlign: TextAlign.left,),
        Text(' - Porto Alegre, 3º andar',
          textAlign: TextAlign.left,),
        Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 0,
          color: Colors.black,
        ),
        Text('Unidade Hub Canoas',
          textAlign: TextAlign.left,),
        Text('(51) 3314-3434(Agendamento de consultas e exames)',
          textAlign: TextAlign.left,),
        Text('(51) 3314-3300(Para informações)',
          textAlign: TextAlign.left,),
        Text('Av. Getúlio Vargas 4831, Canoas.',
          textAlign: TextAlign.left,),
        Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 0,
          color: Colors.black,
        ),
        Text('Central de Encaminhamento de Pacientes',
          textAlign: TextAlign.left,),
        Text('(51) 3537.8888',
          textAlign: TextAlign.left,),




      ],
    );
  }

  Widget logoItem() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset("assets/images/logo-interno.png")
          ],
        ),
      ),
    );
  }
}