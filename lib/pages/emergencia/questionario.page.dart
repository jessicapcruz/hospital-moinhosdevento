import 'package:flutter/material.dart';
import 'package:hospitalmoinhosdevento/pages/home/home.page.dart';
import 'package:hospitalmoinhosdevento/requests/questionario/questionarioRequest.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/questionario/pergunta.dart';
import '../../models/user/paciente.dart';
import '../../scoped_models/main.dart';
import 'emergencia.page.dart';


class QuestionarioPage  extends StatefulWidget {
  const QuestionarioPage({Key? key, required this.idPergunta, required this.idRespota, required this.idPaciente, required this.dataEnvio, required this.peso}) : super(key: key);
  final int idPergunta;
  final int idRespota;
  final int idPaciente;
  final String dataEnvio;
  final int peso;
  @override
  _QuestionarioPageState  createState() => _QuestionarioPageState ();
}

class _QuestionarioPageState extends State<QuestionarioPage> {
  late Paciente user; //instantiate a user
  late Future<Pergunta> pergunta;
  late int _idPaciente = 0;
  late int _idPergunta = 0;
  late int _idReposta = 0;
  late double _peso = 0;
  late String _dataEnvio = "";
  int i = 2;

  set idPaciente(int value) {
    _idPaciente = value;
  }

  set idPergunta(int value) {
    _idPergunta = value;
  }

  set idReposta(int value) {
    _idReposta = value;
  }
  set dataEnvio(String value) {
    _dataEnvio = value;
  }

  set peso(double value) {
    _peso = value;
  }
  int get idPaciente => _idPaciente;
  int get idPergunta => _idPergunta;
  int get idReposta => _idReposta;
  double get peso => _peso;
  String get dataEnvio => _dataEnvio;
  int val = -1;
  bool _value = false;
  @override
  void initState() {
    super.initState();
    MainModel model = ScopedModel.of(context);
    model.setnQuestao(2);
    pergunta = QuestionarioRequest(model.idPaciente, idPergunta, idReposta, dataEnvio, peso).getPergunta();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
              home: Scaffold(
              body: FutureBuilder<Pergunta>(
                future: pergunta,
                builder: (context, snapshot){
                  if (snapshot.hasData) {
                    const Text(
                      '* Este questionario tem o objetivo de avaliar o diagnostico prévio, com base em seus sintomas e inclui-lo na fila de atendimento.',
                      textAlign: TextAlign.left,
                    );
                  try {
                    return Scaffold(
                        body: Container(
                          padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                          color: Colors.white,
                            child: ListView(
                                children: <Widget>[
                                  Card(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text(
                                        '* Este questionario tem o objetivo de avaliar o diagnostico prévio, com base em seus sintomas e inclui-lo na fila de atendimento.',
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(snapshot.data!.perguntaSEQ.toString() + " - " + snapshot.data!.perguntaDES),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data!.perguntaTIP.toString() == "MF" ? 'M ' : "Sim",
                                        ),

                                        Radio(
                                          value: 1,
                                          groupValue: val,
                                          activeColor: Color(0xFF6200EE),
                                          onChanged: (value) {
                                            setState(() {
                                              val = int.parse(value.toString());
                                            });
                                          },
                                        ),

                                        Text(
                                          snapshot.data!.perguntaTIP.toString() == "MF" ? 'F ' : "Não",
                                        ),
                                        Radio(
                                          value: 2,
                                          groupValue: val,
                                          activeColor: Color(0xFF6200EE),
                                          onChanged: (value) {
                                            setState(() {
                                              val = int.parse(value.toString());
                                            });
                                          },
                                        ),
                                        ],
                                    ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    height: 40,
                                    width: 30,
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
                                          "Próxima",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),

                                        onPressed: () async {
                                              try {
                                                if (val == 1) {
                                                  model.setnPeso(double.parse(snapshot.data!.perguntaSIM.toString()));
                                                } else {
                                                  model.setnPeso(double.parse(snapshot.data!.perguntaNAO.toString()));
                                                }
                                                Future<Pergunta> novaPergunta = QuestionarioRequest(model.idPaciente, model.nQuestao,  model.nQuestao, DateTime.now().toString(), model.nPeso).
                                                getPergunta();

                                                model.incrementanQuestao();
                                                setState((){
                                                  this.pergunta = novaPergunta;
                                                });
                                              } catch (e) {
                                                alertDialog(context, "Desculpe, ocorreu um erro ao enviar sua resposta!", " Por favor, tente novamente mais tarde.");
                                              }
                                          },
                                      ),),
                                  ),
                                  ]
                            )
                        )
                    );
                  } catch (e) {
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
                }
              )
              )
          );
          /**
          return Container(
            padding: EdgeInsets.all(5),
            child: const Text(
              '* Este questionario tem o objetivo de avaliar o diagnostico prévio, com base em seus sintomas e inclui-lo na fila de atendimento.',
              textAlign: TextAlign.left,
            ),
            
            
          );*/
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
}