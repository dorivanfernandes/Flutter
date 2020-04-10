import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  int moeda;
  Resultado({this.moeda});

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {

  String _tipoMoeda = "images/moeda_cara.png";

  void _changeMoeda(){

  }

  @override
  Widget build(BuildContext context) {

    if(this.widget.moeda == 0){
      setState(() {
        _tipoMoeda = "images/moeda_cara.png";
      });

    }else{
      setState(() {
        _tipoMoeda = "images/moeda_coroa.png";
      });

    }


    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(_tipoMoeda),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset("images/botao_voltar.png"),
            )
          ],
        ),
      ),
    );
  }
}
