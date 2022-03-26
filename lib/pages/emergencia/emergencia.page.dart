import 'package:flutter/material.dart';
import 'package:hospitalmoinhosdevento/pages/emergencia/questionario.page.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tuple/tuple.dart';

import '../../scoped_models/main.dart';
import '../home/home.page.dart';
import '../home/inicio.page.dart';
import '../profile/profile.page.dart';
import '../unidades/unidades.page.dart';

class EmergenciaPage  extends StatefulWidget {
  const EmergenciaPage({required this.showBottomNav, required this.idPergunta, required this.idRespota, required this.idPaciente, required this.dataEnvio, Key? key, required this.peso, }) : super(key: key);
  final bool showBottomNav;

  final int idPergunta;
  final int idRespota;
  final int idPaciente;
  final double peso;
  final String dataEnvio;

  @override
  _EmergenciaPageState  createState() => _EmergenciaPageState ();
}


class _EmergenciaPageState extends State<EmergenciaPage> {
  final List<Tuple2> _pages = [
    Tuple2('Inicio', InicioPage()),
    Tuple2('Emergência', EmergenciaPage(showBottomNav: false, idPergunta: 0,idRespota: 0, idPaciente:0, dataEnvio:DateTime.now().toString(), peso:0)),
    Tuple2('Perfil', ProfilePage(showBottomNav: true)),
  ];
  var _scrollController = ScrollController();

  int _selectedPage = 1;
  PageController _pageController = PageController();
  late int _idPaciente = 0;
  late int _idPergunta = 0;
  late int _idReposta = 0;
  late double _peso = 0;
  late String _dataEnvio = "";


  set idPaciente(int value) {
    _idPaciente = value;
  }

  set idPergunta(int value) {
    _idPergunta = value;
  }

  set idReposta(int value) {
    _idReposta = value;
  }

  set peso(double value) {
    _peso = value;
  }

  set dataEnvio(String value) {
    _dataEnvio = value;
  }
  int get idPaciente => _idPaciente;
  int get idPergunta => _idPergunta;
  int get idReposta => _idReposta;
  double get peso => _peso;
  String get dataEnvio => _dataEnvio;


  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      if (widget.showBottomNav == true) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Questonario de emergência'),
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
          body: PageView(
            children: [QuestionarioPage(idPaciente: idPaciente, idPergunta: idPergunta, idRespota: idReposta, dataEnvio: dataEnvio, peso: peso)],
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
                label: 'Emergência',
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
      } else {
        return Container(
            child: QuestionarioPage(idPaciente: idPaciente, idPergunta: idPergunta, idRespota: idReposta, dataEnvio: dataEnvio, peso:peso)
        );
      }
    });
  }
}