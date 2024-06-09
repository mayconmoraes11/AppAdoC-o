import 'package:adotar_animais_app/data/classPessoa.dart';
import 'package:adotar_animais_app/data/pessoa_dao.dart';
import 'package:adotar_animais_app/screens/home.dart';
import 'package:flutter/material.dart';

import '../../components/textFromCrud.dart';

class CreatePessoa extends StatefulWidget {
  const CreatePessoa({super.key});

  @override
  State<CreatePessoa> createState() => _CreatePessoaState();
}

class _CreatePessoaState extends State<CreatePessoa> {
  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final telefoneController = TextEditingController();
  final enderecoController = TextEditingController();
  final emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Pessoa'),
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
              valueIsEmpty: 'Informe um CPF valido!',
              ),
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: telefoneController,
              labelTexto: 'Telefone',
              valueIsEmpty: 'Informe um telefone valido!',
              ),
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: enderecoController,
              labelTexto: 'Endereço',
              valueIsEmpty: 'Informe um endereço valido!',
              ),
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: emailController,
              labelTexto: 'E-mail',
              valueIsEmpty: 'Informe um e-mail valido!',
              ),
              ElevatedButton(
                
                onPressed: (){
                  PessoaClass newPessoa = PessoaClass(
                    nome: nomeController.text, 
                    cpf: cpfController.text, 
                    telefone: telefoneController.text, 
                    endereco: enderecoController.text, 
                    email: emailController.text);
                  PessoaDao().savePessoa(newPessoa);
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