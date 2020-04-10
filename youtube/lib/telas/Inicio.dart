import 'package:flutter/material.dart';
import 'package:youtube/API.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    
    API api = API();
    api.pesquisar("");
    
    return Container(
      child: Center(
        child: Text("Inicio", style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
