import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/user/paciente.dart';

class editDialog extends StatefulWidget {


  editDialog({
    Key? key,
    required this.dados,
  }): super(key: key);

  final Future<Paciente> dados;

  @override
  _editDialogState createState() => new _editDialogState();
}

class _editDialogState extends State<editDialog> {
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album),
          subtitle: Text('Novo endereço: '),
        ),
        TextField(
          onChanged: (text) {
            enderecoNovo = text;
          },
        ),
        const ListTile(
          leading: Icon(Icons.album),
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
          onPressed: () {},
          child: const Text('Cancelar'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style: style,
          onPressed: () {},
          child: const Text('Salvar'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getContent();
  }
}