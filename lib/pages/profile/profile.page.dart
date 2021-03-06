import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/user/paciente.dart';
import '../../requests/paciente/pacienteRequest.dart';
import '../../scoped_models/main.dart';
import '../emergencia/emergencia.page.dart';
import '../home/home.page.dart';
import 'editDialog.dart';
import 'editProfile.page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({required this.showBottomNav, Key? key}) : super(key: key);

  final bool showBottomNav;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>  {
  late Paciente user; //instantiate a user
  late Future<Paciente> futurePaciente;
  int _selectedPage = 2;
  PageController _pageController = PageController();
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
      if (widget.showBottomNav == true) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Perfil'),
            actions: <Widget>[
              Container(
                width: 60,
                child: FlatButton(
                  child: Icon(
                    Icons.search,
                    color: Color(0xFFBABABA),
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
          body: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              resizeToAvoidBottomInset: false,
              body: FutureBuilder<Paciente>(
                future: futurePaciente,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    try {
                      return Scaffold(
                          resizeToAvoidBottomInset: false,
                          body: SingleChildScrollView (
                            child: Container(
                              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                              color: Colors.white,
                              height: 500,
                              //height: MediaQuery.of(context).size.height,
                              child: ListView(
                                children: <Widget>[
                                  Container(
                                    width: 200,
                                    height: 200,
                                    alignment: const Alignment(0.0, 1.15),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/profile-picture.png"),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const ListTile(
                                          leading: Icon(Icons.account_circle_outlined),
                                          title: Text('Dados Pessoais'),
                                        ),
                                        const ListTile(
                                          subtitle: Text('Nome: '),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                            child:Text(snapshot.data!.nome_completo, textAlign: TextAlign.left)),
                                        const ListTile(
                                          subtitle: Text('Nome da M??e: '),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                            child:Text(snapshot.data!.nome_mae, textAlign: TextAlign.left)),
                                        const ListTile(
                                          subtitle: Text('CPF: '),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                            child:Text(snapshot.data!.cpf, textAlign: TextAlign.left)),
                                      ],
                                    ),
                                  ),
                                  Card(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const ListTile(
                                          leading: Icon(Icons.album),
                                          title: Text('Contato:'),

                                        ),
                                        const ListTile(
                                          subtitle: Text('Endere??o:'),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                            child:Text(snapshot.data!.endereco, textAlign: TextAlign.left)),
                                        const ListTile(
                                          subtitle: Text('Email:'),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                            child:Text(snapshot.data!.email, textAlign: TextAlign.left)),
                                        const ListTile(
                                          subtitle: Text('Telefone:'),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                            child:Text(snapshot.data!.telefone, textAlign: TextAlign.left)),
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
                          )
                      );
                    } catch (e){
                      return AlertDialog(
                        title: const Text('Falha ao carregar as informa????es'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text('Desculpe, n??o foi possivel carregar as informa????es.'),
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
                      title: const Text('Falha ao carregar as informa????es'),
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
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_outlined),
                label: 'Emerg??ncia',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_sharp),
                label: 'Perfil',
                backgroundColor: Colors.blue,

              ),
            ],
            currentIndex: _selectedPage,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.blue,
            onTap: (index) {
              index == 0 ?
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              ): index == 1 ?
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmergenciaPage(showBottomNav: true, idPergunta: 0,idRespota: 0, idPaciente:0, dataEnvio:DateTime.now().toString(), peso:0),
                ),
              ) :
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(showBottomNav: true),
                ),
              )
              ;
            },
          ),
        );
      }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              resizeToAvoidBottomInset: false,
              body: FutureBuilder<Paciente>(
                future: futurePaciente,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    try {
                      return Scaffold(
                          resizeToAvoidBottomInset: false,
                        body: SingleChildScrollView (
                        child: Container(
                          padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                          color: Colors.white,
                          height: 500,
                          //height: MediaQuery.of(context).size.height,
                          child: ListView(
                            children: <Widget>[
                              Container(
                                width: 200,
                                height: 200,
                                alignment: const Alignment(0.0, 1.15),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/profile-picture.png"),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const ListTile(
                                      leading: Icon(Icons.account_circle_outlined),
                                      title: Text('Dados Pessoais'),
                                    ),
                                    const ListTile(
                                      subtitle: Text('Nome: '),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      child:Text(snapshot.data!.nome_completo, textAlign: TextAlign.left)),
                                    const ListTile(
                                      subtitle: Text('Nome da M??e: '),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child:Text(snapshot.data!.nome_mae, textAlign: TextAlign.left)),
                                    const ListTile(
                                      subtitle: Text('CPF: '),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child:Text(snapshot.data!.cpf, textAlign: TextAlign.left)),
                                  ],
                                ),
                              ),
                              Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const ListTile(
                                      leading: Icon(Icons.album),
                                      title: Text('Contato:'),

                                    ),
                                    const ListTile(
                                      subtitle: Text('Endere??o:'),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child:Text(snapshot.data!.endereco, textAlign: TextAlign.left)),
                                    const ListTile(
                                      subtitle: Text('Email:'),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child:Text(snapshot.data!.email, textAlign: TextAlign.left)),
                                    const ListTile(
                                      subtitle: Text('Telefone:'),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child:Text(snapshot.data!.telefone, textAlign: TextAlign.left)),
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
                        )
                      );
                    } catch (e){
                      return AlertDialog(
                        title: const Text('Falha ao carregar as informa????es'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text('Desculpe, n??o foi possivel carregar as informa????es.'),
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
                      title: const Text('Falha ao carregar as informa????es'),
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


