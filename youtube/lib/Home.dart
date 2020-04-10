import 'package:flutter/material.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Incricao.dart';
import 'package:youtube/telas/Inicio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Incricao(),
      Biblioteca()

    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1
        ),
        backgroundColor: Colors.white,
        title: Image.asset("images/youtube.png", width: 98, height: 22,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){

            },
          )
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            title: Text("Início"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              //backgroundColor: Colors.grey,
              title: Text("Em alta"),
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
             // backgroundColor: Colors.blue,
              title: Text("Inscrições"),
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
              //backgroundColor: Colors.green,
              title: Text("Biblioteca"),
              icon: Icon(Icons.folder)
          ),
        ],
      ),
    );
  }
}