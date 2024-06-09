import 'package:adotar_animais_app/data/classAnimal.dart';
import 'package:adotar_animais_app/data/animal_dao.dart';
import 'package:adotar_animais_app/screens/home.dart';
import 'package:flutter/material.dart';

import '../../components/textFromCrud.dart';

class CreateAnimal extends StatefulWidget {
  const CreateAnimal({super.key});

  @override
  State<CreateAnimal> createState() => _CreateAnimalState();
}

class _CreateAnimalState extends State<CreateAnimal> {
  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final idadeController = TextEditingController();
  final racaController = TextEditingController();
  final descricaoController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Animal'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
             TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: nomeController,
              labelTexto: 'Nome',
              valueIsEmpty: 'Informe um nome valido!',
              ),
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: cpfController,
              labelTexto: 'CPF',
              valueIsEmpty: 'Informe o CPF do doador/repector valido!',
              ),
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: idadeController,
              labelTexto: 'Idade',
              valueIsEmpty: 'Informe a idade do animal!',
              ),
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: racaController,
              labelTexto: 'Raça',
              valueIsEmpty: 'Informe a raça do animal!',
              ),
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: descricaoController,
              labelTexto: 'Descrição',
              valueIsEmpty: 'Descreva as características do animal (porte, comportamento, entre outros)'
              ),
              ElevatedButton(
                
                onPressed: (){
                  AnimalClass newAnimal = AnimalClass(
                    nome: nomeController.text, 
                    cpf: cpfController.text, 
                    idade: idadeController.text, 
                    raca: racaController.text, 
                    descricao: descricaoController.text);
                  AnimalDao().saveAnimal(newAnimal);
                  Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (route) => false);
              }, 
                child: Text('Cadastrar'))
            ],
          ),
        ),
      ),
    );

  }
}