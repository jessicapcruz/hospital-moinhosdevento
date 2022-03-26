import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/resultado/nivelRisco.dart';
import '../../models/resultado/resultado.dart';
import '../../requests/questionario/questionarioRequest.dart';
import '../../scoped_models/main.dart';
import '../home/home.page.dart';

class resultadoPage extends StatefulWidget {

  @override
  _resultadoPageState createState() => new _resultadoPageState();
}

class _resultadoPageState extends State<resultadoPage> {
  int _selectedIndex = 0;
  String enderecoNovo = "";
  String emailNovo = "";
  late Future<Resultado> resultado;
  @override
  void initState(){
    super.initState();
    print('result null');
    MainModel model = ScopedModel.of(context);
    resultado = QuestionarioRequest(model.idPaciente, 0, 0, 0).obterResultado();

  }
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  _getContent()   {

    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {

      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
          body: FutureBuilder<Resultado>(
          future: resultado,
          builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center (
           child: Container(
              padding: EdgeInsets.only(top: 60, left: 40, right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  snapshot.data!.nivelRisco['descricao'].toString() == "Alto: VERMELHO" ?

                  Container(
                    height: 100,
                    width: 200,
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [
                          Color(0xFFD50000),
                          Color(0xFFD50000),
                        ],
                      ),

                    ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Classificação: Alto',textAlign: TextAlign.center,),
                          Text('Tempo de espera: ' + snapshot.data!
                              .nivelRisco['tempoEspera'].toString(),textAlign: TextAlign.center,),
                          Text('Data da emergencia: ' + snapshot.data!
                              .dataEmergencia, textAlign: TextAlign.center,),
                        ],
                      ),
                  ) :
                  snapshot.data!.nivelRisco['descricao'].toString().contains("LARANJA") ||
                      snapshot.data!.nivelRisco['descricao'].toString().contains("laranja") ?
                  Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [
                            Color(0xFFFF9100),
                            Color(0xFFFF9100),
                          ],
                        ),

                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Classificação: Médio',textAlign: TextAlign.center,),
                        Text('Tempo de espera: ' + snapshot.data!
                            .nivelRisco['tempoEspera'].toString(),textAlign: TextAlign.center,),
                        Text('Data da emergencia: ' + snapshot.data!
                            .dataEmergencia, textAlign: TextAlign.center,),
                      ],
                    ),) : snapshot.data!.nivelRisco['descricao'].toString().contains(
                      "AMARELO") ||
                      snapshot.data!.nivelRisco['descricao'].toString().contains("amarelo") ?
                  Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [
                            Color(0xFFFFD740),
                            Color(0xFFFFD740),
                          ],
                        ),

                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Classificação: Moderado',textAlign: TextAlign.center,),
                        Text('Tempo de espera: ' + snapshot.data!
                            .nivelRisco['tempoEspera'].toString(),textAlign: TextAlign.center,),
                        Text('Data da emergencia: ' + snapshot.data!
                            .dataEmergencia, textAlign: TextAlign.center,),
                      ],
                    ),

                  ) :
                  Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [
                            Color(0xFFB2FF59),
                            Color(0xFFB2FF59),
                          ],
                        ),

                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Classificação: Baixo',textAlign: TextAlign.center,),
                        Text('Tempo de espera: ' + snapshot.data!
                            .nivelRisco['tempoEspera'].toString(),textAlign: TextAlign.center,),
                        Text('Data da emergencia: ' + snapshot.data!
                            .dataEmergencia, textAlign: TextAlign.center,),
                      ],
                    ),

                  )


                ],
              )
          )
          );
        }
        return const CircularProgressIndicator();
      }
            )
            )
      )
      ;
  }
  );
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