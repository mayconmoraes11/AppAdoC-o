import 'package:adotar_animais_app/data/classAnimal.dart';
import 'package:adotar_animais_app/data/animal_dao.dart';
import 'package:adotar_animais_app/screens/animal/CrudAnimal.dart';
import 'package:flutter/material.dart';


class updateAnimal extends StatefulWidget {
  List<AnimalClass>? animal;
  updateAnimal({super.key, required this.animal});

  
  @override
  State<updateAnimal> createState() => _updateAnimalState();
}

class _updateAnimalState extends State<updateAnimal> {

  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCPF = TextEditingController();
  TextEditingController controllerIdade = TextEditingController();
  TextEditingController controllerRaca = TextEditingController();
  TextEditingController controllerDescricao = TextEditingController();

  void initState() {
    super.initState();
    initItem();
  }

  void didUpdateWidget(covariant updateAnimal oldWidget) {
    super.didUpdateWidget(oldWidget);
    initItem();
  }

  void initItem() {
    final cpf = widget.animal == null
        ? ''
        : widget.animal![0].cpf;
    final nome = widget.animal == null
        ? ''
        : widget.animal![0].nome;
    final idade = widget.animal == null
        ? ''
        : widget.animal![0].idade;
    final raca = widget.animal == null
        ? ''
        : widget.animal![0].raca;
    final descricao = widget.animal == null
        ? ''
        : widget.animal![0].descricao;
        
    setState(() {
      controllerCPF =
          TextEditingController(text: cpf);
      controllerNome = TextEditingController(text: nome);
      controllerIdade = TextEditingController(text: idade);
      controllerRaca = TextEditingController(text: raca);
      controllerDescricao = TextEditingController(text: descricao);
    });
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text('Update Animal'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child:Padding(
            padding:
                EdgeInsets.only(top: (size.height) / 6, left: size.width / 12),
            child: Container(
              width: screenWidth / 1.2,
              height: screenHeight / 1.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.blue)),
              alignment: Alignment.center,
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerCPF,
                      onTap: () {
                        controllerCPF.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'CPF'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o CPF corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerNome,
                      onTap: () {
                        controllerNome.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Nome'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o nome corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerIdade,
                      onTap: () {
                        controllerIdade.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Idade'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe a idade corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerRaca,
                      onTap: () {
                        controllerRaca.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Raça'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe a raça corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerDescricao,
                      onTap: () {
                        controllerDescricao.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Descrição'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe a descrição corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: SizedBox(
                        child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.update),
                          Padding(
                            padding: EdgeInsets.only(left: (0)),
                            child: Text(
                              'Update',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        print('Uptade');
                        AnimalClass newAnimal = AnimalClass(
                          nome: controllerNome.text, 
                          cpf: controllerCPF.text, 
                          idade: controllerIdade.text, 
                          raca: controllerRaca.text, 
                          descricao: controllerDescricao.text);
                        AnimalDao().updateData(newAnimal);
                        print('Uptade2');
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => CRUDAnimal()),
                            (Route<dynamic> route) => false);
                      },
                    )),
                  )

                ],
              ),
            ),
          ),
          
        ),
    );
  }
}