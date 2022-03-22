import 'package:flutter/material.dart';
import 'package:hospitalmoinhosdevento/pages/emergencia/questionario.page.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tuple/tuple.dart';

import '../../scoped_models/main.dart';
import '../home/inicio.page.dart';
import '../profile/profile.page.dart';

class EmergenciaPage  extends StatefulWidget {
  EmergenciaPage({Key? key, required this.showBottomNav}) : super(key: key);
  final bool showBottomNav;


  @override
  _EmergenciaPageState  createState() => _EmergenciaPageState ();
}


class _EmergenciaPageState extends State<EmergenciaPage> {
  final List<Tuple2> _pages = [
    Tuple2('Inicio', InicioPage()),
    Tuple2('Emergência', EmergenciaPage(showBottomNav: false)),
    Tuple2('Perfil', ProfilePage()),
  ];


  int _selectedPage = 0;
  PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model)
    {
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
            children: [QuestionarioPage()],
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
              setState(() {
                _selectedPage = index;
                _pageController.animateToPage(_selectedPage,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              });
            },
          ),
        );
      } else {
        return Container(
            child: QuestionarioPage()
        );
      }
    });
  }
}