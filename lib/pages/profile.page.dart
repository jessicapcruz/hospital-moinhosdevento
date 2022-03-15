import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/user/user.dart';
import '../providers/UserProvider.dart';
import '../requests/userRequest.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>  {
  late User user; //instantiate a user
  late List< User> followers; // instantiate


  @override
  Widget build(BuildContext context) {
    setState(() {
      followers = [];
      //this function gets a user from the username supplied in the input
      //  user = Provider.of<UserProvider>(context).getUser();

      // this method returns followers of the username supplied in the input as a list
      //using the UserProvider
      UserRequest('teste').fetchFollowers().then((following) {
        Iterable list = json.decode(following.body);
        setState(() {
          followers = list.map((e) => User.fromJson(e)).toList();
        });
      });
    });

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: followers != null
        ?
    ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: followers.length, // the number of followers a user has
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      // followers's profile picture
                      backgroundImage: NetworkImage("profile-picture.png"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.account_circle_outlined),
                          title: Text('Dados Pessoais'),
                        ),
                        const ListTile(
                          subtitle: Text('Nome: '),
                        ),
                        followers[index].nome_completo != null
                            ? Text(
                          followers[index].nome_completo,
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        )
                            : Text(
                          "Not Available",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        ),

                        const ListTile(
                          subtitle: Text('CPF: '),
                        ),
                        followers[index].cpf != null
                            ? Text(
                          followers[index].cpf,
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        )
                            : Text(
                          "Not Available",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        ),
                        const ListTile(
                          subtitle: Text('Nome da mãe: '),
                        ),
                        followers[index].nome_mae != null
                            ? Text(
                          followers[index].nome_mae,
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        )
                            : Text(
                          "Not Available",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        )

                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          subtitle: Text('Endereço: '),
                        ),
                        followers[index].endereco != null
                            ? Text(
                          followers[index].endereco,
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        )
                            : Text(
                          "Not Available",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        ),
                        const ListTile(
                          subtitle: Text('Telefone: '),
                        ),
                        followers[index].telefone != null
                            ? Text(
                          followers[index].telefone,
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        )
                            : Text(
                          "Not Available",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        ),
                        const ListTile(
                          subtitle: Text('E-mail: '),
                        ),
                        followers[index].email != null
                            ? Text(
                          followers[index].email,
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        )
                            : Text(
                          "Not Available",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Ink(
                              decoration: const ShapeDecoration(
                                color: Colors.lightBlue,
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.create_outlined),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    )
        :  Container(
            child: Align(
                child: Text(
                    'Not Available')
              )
            ), // before the data is returned, indicate loading data
      ),
    );
  }


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
