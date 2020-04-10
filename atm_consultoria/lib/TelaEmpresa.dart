import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Empresa"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("images/detalhe_empresa.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Sobre a empresa",
                      style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit amet auctor nisl, at tempus ligula. Nullam blandit placerat varius. Sed facilisis turpis at ligula egestas, vehicula varius libero pellentesque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed commodo nibh ac velit imperdiet, nec dictum mauris vehicula. Ut quis ex dui. Nunc non convallis lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur dignissim, elit sed tincidunt scelerisque, purus ante porta tellus, eget posuere lectus erat et libero. In sed aliquam diam. Quisque tempus neque ex, sed tincidunt mauris laoreet at. Aenean pharetra rhoncus vulputate."
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
