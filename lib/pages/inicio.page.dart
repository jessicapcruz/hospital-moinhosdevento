import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF2F3F6),
        child: ListView(
          children: <Widget>[
            profileItem(),
            formularioEmergencia ()
          ],
        ),
      ),
    );
  }
}


Widget formularioEmergencia (){
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      IconButton(
        icon: const Icon(Icons.assignment_outlined ),
        tooltip: 'Formulario de emergência',
        iconSize:80, onPressed: () {  },
      ),
      Text('Emergência')
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
Widget cardItem() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      IconButton(
        icon: const Icon(Icons.assignment_outlined ),
        tooltip: 'Formulario de emergência',
        iconSize:80, onPressed: () {  },
      ),
      Text('Emergência')
    ],
  );}

Widget cardItem1() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        //const ListTile(
        //leading: CircleAvatar(
        //backgroundImage: NetworkImage(
        //  "https://baltaio.blob.core.windows.net/student-images/1edd5c50-bae9-11e8-8eb4-39de303632c1.jpg"),
        //),
        //title: Text("Bruce Wayne"),
        //subtitle: Text("09/05/2019 18:37"),
        //trailing: Icon(Icons.more_vert),
        //  ),
        Container(
          child: Image.asset("assets/user-picture.png"),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
              "Questionario de emergencia"),
        ),
        ButtonTheme(
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Icon(Icons.favorite),
                onPressed: () {},
              ),
              FlatButton(
                child: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
