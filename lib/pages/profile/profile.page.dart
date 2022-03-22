import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/user/paciente.dart';
import '../../requests/paciente/pacienteRequest.dart';
import '../../scoped_models/main.dart';
import 'editDialog.dart';
import 'editProfile.page.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>  {
  late Paciente user; //instantiate a user
  late Future<Paciente> futurePaciente;

  int _selectedCountryIndex = 0;


  @override
  void initState() {
    super.initState();
    MainModel model = ScopedModel.of(context);
    futurePaciente = PacienteRequest(model.idPaciente).getPaciente();

  }
  _showDialog() async{
    await showDialog<String>(
      context: context,
      builder: (BuildContext context){
        return CupertinoAlertDialog(
          title: new Text('Editar Dados'),
          actions: <Widget>[
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: (){Navigator.of(context).pop('Cancel');},
              child: new Text('Cancelar'),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: (){Navigator.of(context).pop('Accept');},
              child: new Text('Salvar'),
            ),
          ],
          content: SingleChildScrollView(
            child: Material(
              child: editDialog(dados: futurePaciente),
            ),
          ),
        );
      },
      barrierDismissible: false,
    );
  }



  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return MaterialApp(
            home: Scaffold(
              body: FutureBuilder<Paciente>(
                future: futurePaciente,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    try {
                      return Scaffold(
                        body: Container(
                          padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                          color: Colors.white,
                          child: ListView(
                            children: <Widget>[
                              Container(
                                width: 200,
                                height: 200,
                                alignment: const Alignment(0.0, 1.15),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("profile-picture.png"),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                child: Container(
                                  height: 56,
                                  width: 56,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [0.3, 1.0],
                                      colors: [
                                        Color(0xFF245FF5),
                                        Color(0XFFF92B7F),
                                      ],
                                    ),
                                    border: Border.all(
                                      width: 4.0,
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(56),
                                    ),
                                  ),
                                  child: SizedBox.expand(
                                    child: FlatButton(
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const ListTile(
                                      leading: Icon(Icons.account_circle_outlined),
                                      title: Text('Dados Pessoais'),
                                    ),
                                    const ListTile(
                                      subtitle: Text('Nome: '),
                                    ),
                                    Text(snapshot.data!.nome_completo),
                                    const ListTile(
                                      subtitle: Text('Nome da Mãe: '),
                                    ),
                                    Text(snapshot.data!.nome_mae),
                                    const ListTile(
                                      subtitle: Text('CPF: '),
                                    ),
                                    Text(snapshot.data!.cpf),
                                  ],
                                ),
                              ),
                              Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const ListTile(
                                      leading: Icon(Icons.album),
                                      title: Text('Endereço:'),

                                    ),
                                    Text(snapshot.data!.endereco),
                                    const ListTile(
                                      leading: Icon(Icons.album),
                                      title: Text('Email:'),
                                    ),
                                    Text(snapshot.data!.email),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Ink(
                                          decoration: const ShapeDecoration(
                                            color: Colors.lightBlue,
                                            shape: CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(Icons.create_outlined),
                                            color: Colors.white,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      editProfilePage(
                                                          dados: futurePaciente),
                                                ),
                                              );
                                              //WidgetsBinding.instance?.addPostFrameCallback((_){_showDialog();});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } catch (e){
                      return AlertDialog(
                        title: const Text('Falha ao carregar as informações'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text('Desculpe, não foi possivel carregar as informações.'),
                              Text('Por favor, tente novamente mais tarde.'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    }
                  } else if (snapshot.hasError) {
                    return AlertDialog(
                      title: const Text('Falha ao carregar as informações'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('${snapshot.error}'),
                            Text('Por favor, tente novamente mais tarde.'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          );
    });
  }
}


@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}

