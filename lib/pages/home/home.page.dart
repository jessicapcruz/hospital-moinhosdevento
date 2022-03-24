import 'package:flutter/material.dart';
import 'package:hospitalmoinhosdevento/pages/profile/profile.page.dart';
import '../emergencia/emergencia.page.dart';
import 'inicio.page.dart';
import 'package:tuple/tuple.dart';
class HomeScreen  extends StatefulWidget {
  @override
  _HomeScreenState  createState() => _HomeScreenState ();
}

class _HomeScreenState  extends State<HomeScreen> {
  final List<Tuple2> _pages = [
    Tuple2('Inicio', InicioPage()),
    const Tuple2('Emergência', EmergenciaPage(showBottomNav: false, idPergunta: 0,idRespota: 0, idPaciente:0, dataEnvio:"")),
    Tuple2('Perfil', ProfilePage()),
  ];
  int _selectedPage = 0;
  PageController _pageController = PageController();
  void _onBackPressed() {
    // Called when the user either presses the back arrow in the AppBar or
    // the dedicated back button.
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _onBackPressed,
        ),
        actions: <Widget>[
          Container(
            width: 60,
            child: FlatButton(
              child: const Icon(
                Icons.search,
                color: Color(0xFFBABABA),
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: PageView(
        children: _pages.map<Widget>((Tuple2 page) => page.item2).toList(),
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        controller: _pageController,
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
                duration: const Duration(milliseconds: 300), curve: Curves.linear);
          });
        },
      ),
    );
  }
}


