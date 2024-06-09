import 'package:adotar_animais_app/screens/animal/mostrarAnimal.dart';
import 'package:flutter/material.dart';

import '../../components/textFromCrud.dart';
import '../../data/classAnimal.dart';
import '../../data/animal_dao.dart';

class buscaAnimal extends StatefulWidget {
  const buscaAnimal({super.key});

  @override
  State<buscaAnimal> createState() => _buscaAnimalState();
}

class _buscaAnimalState extends State<buscaAnimal> {
  final cpfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Animal'),
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
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: cpfController,
              labelTexto: 'CPF',
              valueIsEmpty: 'Informe um CPF valido!',
              ),
              ElevatedButton(onPressed: () async {
                final AnimalDao animalDao = AnimalDao();
                List<AnimalClass> animais = await animalDao.find(cpfController.text);
                
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mostrarAnimal(animal: animais,)));
              }, 
              child: Text('Buscar'))
            ],
          ),
        ),
      ),
    );
  }
}