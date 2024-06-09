import 'package:adotar_animais_app/screens/tipo/buscaTipo.dart';
import 'package:adotar_animais_app/screens/tipo/createTipo.dart';
import 'package:flutter/material.dart';

class CRUDTipo extends StatefulWidget {
  const CRUDTipo({super.key});

  @override
  State<CRUDTipo> createState() => _CRUDTipoState();
}

class _CRUDTipoState extends State<CRUDTipo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipo'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              ElevatedButton(onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateTipo()),
              );
              }, child: Text('Criar')),
              
              ElevatedButton(onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => buscaTipo()),
              );
              }, child: Text('Buscar')),
              
            ],
          ),
        ),),
    );
  }
}