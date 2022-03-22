import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmoinhosdevento/pages/profile/profile.page.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/user/paciente.dart';
import '../../requests/paciente/pacienteRequest.dart';
import '../../scoped_models/main.dart';

class editProfilePage extends StatefulWidget {
  editProfilePage({required this.dados});

  final Future<Paciente> dados;


  @override
  _editProfilePageState createState() => new _editProfilePageState();
}

class _editProfilePageState extends State<editProfilePage> {
  int _selectedIndex = 0;
  String enderecoNovo = "";
  String emailNovo = "";


  @override
  void initState(){
    super.initState();
    debugPrint('editDialog');
  }
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  _getContent(){
    if (widget.dados == null){

      debugPrint('null dados ');
      return new Container();
    }

    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model)
    {
      return Container(
          padding: EdgeInsets.only(top: 60, left: 40, right: 40),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("app-logo.png"),
              ),
              const ListTile(
                leading: Icon(Icons.create_outlined),
                subtitle: Text('Novo endereço: '),
              ),
              TextField(
                onChanged: (text) {
                  enderecoNovo = text;
                },
              ),
              const ListTile(
                leading: Icon(Icons.create_outlined),
                subtitle: Text('Novo e-mail: '),
              ),
              TextField(
                onChanged: (text) {
                  emailNovo = text;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
                child: const Text('Cancelar'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () async {
                  widget.dados.then((Paciente data) async {
                     Paciente updatePaciente = new Paciente(
                        id:data.id ,
                        nome_completo:data.nome_completo ,
                        nome_mae:data.nome_mae ,
                        cpf:data.cpf ,
                        endereco:enderecoNovo ,
                        telefone:data.telefone ,
                        email:emailNovo
                        );

                     Paciente p = await PacienteRequest(model.idPaciente).createPost(
                         body: updatePaciente.toMap());
                  });},
                child: const Text('Salvar'),
              ),
            ],
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _getContent();
  }
}