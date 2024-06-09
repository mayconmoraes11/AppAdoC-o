import 'package:adotar_animais_app/screens/pessoa/buscaPessoa.dart';
import 'package:adotar_animais_app/screens/pessoa/createPessoa.dart';
import 'package:flutter/material.dart';

class CRUDPessoa extends StatefulWidget {
  const CRUDPessoa({super.key});

  @override
  State<CRUDPessoa> createState() => _CRUDPessoaState();
}

class _CRUDPessoaState extends State<CRUDPessoa> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pessoa'),
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
                MaterialPageRoute(builder: (context) => CreatePessoa()),
              );
              }, child: Text('Criar')),
              
              ElevatedButton(onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => buscaPessoa()),
              );
              }, child: Text('Buscar')),
              
            ],
          ),
        ),),
    );
  }
}