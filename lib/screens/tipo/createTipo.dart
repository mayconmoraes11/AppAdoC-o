import 'package:adotar_animais_app/data/classTipo.dart';
import 'package:adotar_animais_app/data/tipo_dao.dart';
import 'package:adotar_animais_app/screens/home.dart';
import 'package:flutter/material.dart';

import '../../components/textFromCrud.dart';

class CreateTipo extends StatefulWidget {
  const CreateTipo({super.key});

  @override
  State<CreateTipo> createState() => _CreateTipoState();
}

class _CreateTipoState extends State<CreateTipo> {
  final cpfController = TextEditingController();
  final idCachorroController = TextEditingController();
  final tipoController = TextEditingController();
  final descricaoController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Tipo'),
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
              item: cpfController,
              labelTexto: 'CPF',
              valueIsEmpty: 'Informe um cpf valido!',
              ),
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: idCachorroController,
              labelTexto: 'idCachorro',
              valueIsEmpty: 'Informe um id valido!',
              ),
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: tipoController,
              labelTexto: 'Tipo',
              valueIsEmpty: 'Informe um Tipo valido!',
              ),
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: descricaoController,
              labelTexto: 'Descrição',
              valueIsEmpty: 'Informe uma descrição valida!',
              ),
              
              ElevatedButton(
                
                onPressed: (){
                  TipoClass newTipo = TipoClass(
                    cpf: cpfController.text,
                    idCachorro: idCachorroController.text, 
                    tipo: tipoController.text, 
                    descricao: descricaoController.text, );
                    print('Testeeeeee');
                    print(newTipo.descricao + ' Descr');
                  TipoDao().saveTipo(newTipo);
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