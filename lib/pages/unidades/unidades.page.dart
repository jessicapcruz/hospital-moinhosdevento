import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hospitalmoinhosdevento/pages/atendimento/prontoAtendimento.page.dart';
import 'package:hospitalmoinhosdevento/pages/unidades/unidades.page.dart';
import 'package:tuple/tuple.dart';

import '../emergencia/emergencia.page.dart';
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
    Tuple2('Emergência', EmergenciaPage(showBottomNav: false)),
    Tuple2('Perfil', ProfilePage()),
  ];
  int _selectedPage = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Unidades'),
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
        children: [ListaUnidadesPage()],
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
            icon: Icon(Icons.person_sharp ),
            label: 'Perfil',
            backgroundColor: Colors.blue,

          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
            _pageController.animateToPage(_selectedPage,
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          });
        },
      ),
    );


  }
}




