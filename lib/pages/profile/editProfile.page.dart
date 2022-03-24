import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmoinhosdevento/pages/profile/profile.page.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/user/paciente.dart';
import '../../requests/paciente/pacienteRequest.dart';
import '../../scoped_models/main.dart';
import '../home/home.page.dart';

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
  }
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  _getContent(){
    if (widget.dados == null){

      debugPrint('null dados ');
      return new Container();
    }

    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Container(
          padding: EdgeInsets.only(top: 60, left: 40, right: 40),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/images/app-logo.png"),
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
              const SizedBox(height: 10),
              Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                  Color(0xFF0277BD),
                  Color(0XFF01579B),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              ),
              child: SizedBox.expand(
              child: FlatButton(
                    child: const Text(
                      "Salvar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async {
                      widget.dados.then((Paciente data) async {
                         Paciente updatePaciente = Paciente(
                             paciente_id:data.paciente_id ,
                            nome_completo:data.nome_completo ,
                            data_nascimento:data.data_nascimento,
                            nome_mae:data.nome_mae ,
                            cpf:data.cpf ,
                            endereco:enderecoNovo ,
                            telefone:data.telefone ,
                            email:emailNovo
                            );
                         try {
                           await PacienteRequest(model.idPaciente).updatePaciente(
                               updatePaciente);
                           alertDialog(context, "Concluido", "Informações alteradas com sucesso!");
                         } catch (e) {
                           alertDialog(context, "Desculpe, ocorreu um erro ao gravar as informações!", " Por favor, tente novamente mais tarde.");
                         }
                        // Paciente p = await PacienteRequest(model.idPaciente).createPost(
                            // body: updatePaciente.toMap());
                      });},
                  ),),
              ),

              const SizedBox(height: 10),
              Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: FlatButton(
                      child: const Text(
                        "Cancelar",
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      }
                  )
              ),
            ],
          )
      );
    });
  }

  Future alertDialog( BuildContext context, String title, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return _getContent();
  }
}