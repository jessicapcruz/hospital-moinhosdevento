import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import '../emergencia/emergencia.page.dart';
import '../home/home.page.dart';
import '../home/inicio.page.dart';
import '../profile/profile.page.dart';
import 'listaUnidades.page.dart';

class UnidadesPage  extends StatefulWidget {

  @override
  _UnidadesPageState  createState() => _UnidadesPageState ();
}


class _UnidadesPageState extends State<UnidadesPage> {
  final List<Tuple2> _pages = [
    Tuple2('Inicio', InicioPage()),
    Tuple2('EmergĂȘncia', EmergenciaPage(showBottomNav: false, idPergunta: 0,idRespota: 0, idPaciente:0, dataEnvio:DateTime.now().toString(), peso:0)),
    Tuple2('Perfil', ProfilePage(showBottomNav: false)),
  ];
  int _selectedPage = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Unidades'),
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
        children: const [ListaUnidadesPage()],
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
            label: 'EmergĂȘncia',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp ),
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
          );
        },
      ),
    );


  }
}




