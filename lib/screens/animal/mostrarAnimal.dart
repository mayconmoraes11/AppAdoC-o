
import 'package:adotar_animais_app/data/classAnimal.dart';
import 'package:adotar_animais_app/data/animal_dao.dart';
import 'package:adotar_animais_app/screens/animal/crudAnimal.dart';
import 'package:adotar_animais_app/screens/animal/updateAnimal.dart';
import 'package:flutter/material.dart';

class mostrarAnimal extends StatefulWidget {
  List<AnimalClass>? animal;
  mostrarAnimal({super.key, required this.animal});

  @override
  State<mostrarAnimal> createState() => _mostrarAnimalState();
}

class _mostrarAnimalState extends State<mostrarAnimal> {
  
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
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                height: screenHeight/6,
                width: screenWidth/2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nome: ' + widget.animal![0].nome),
                        ElevatedButton(onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => updateAnimal(animal: widget.animal,)));
                        }, child: Text('Update')),
                        ElevatedButton(onPressed: (){
                          AnimalDao().delete(widget.animal![0].cpf);
                          Navigator.of(context).pop();
                        }, child: Text('Delete'))
                      ],
                    ),
                    Text('CPF: ' + widget.animal![0].cpf),
                    Text('Idade: ' + widget.animal![0].idade),
                    Text('Raça: ' + widget.animal![0].raca),
                    Text('Descrição: ' + widget.animal![0].descricao),
                  ],
                ),
                
              ),
            ],
          ),
        ),
    );
  }
}