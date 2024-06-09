import 'package:adotar_animais_app/screens/animal/buscaAnimal.dart';
import 'package:adotar_animais_app/screens/animal/createAnimal.dart';
import 'package:flutter/material.dart';

class CRUDAnimal extends StatefulWidget {
  const CRUDAnimal({super.key});

  @override
  State<CRUDAnimal> createState() => _CRUDAnimalState();
}

class _CRUDAnimalState extends State<CRUDAnimal> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal'),
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
                MaterialPageRoute(builder: (context) => CreateAnimal()),
              );
              }, child: Text('Criar')),
              
              ElevatedButton(onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => buscaAnimal()),
              );
              }, child: Text('Buscar')),
              
            ],
          ),
        ),),
    );
  }
}