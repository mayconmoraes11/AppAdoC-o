import 'package:adotar_animais_app/screens/pessoa/mostrarPessoa.dart';
import 'package:flutter/material.dart';

import '../../components/textFromCrud.dart';
import '../../data/classPessoa.dart';
import '../../data/pessoa_dao.dart';

class buscaPessoa extends StatefulWidget {
  const buscaPessoa({super.key});

  @override
  State<buscaPessoa> createState() => _buscaPessoaState();
}

class _buscaPessoaState extends State<buscaPessoa> {
  final cpfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Pessoa'),
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
                final PessoaDao pessoaDao = PessoaDao();
                List<PessoaClass>? pessoas = await pessoaDao.find(cpfController.text);
                
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mostrarPessoa(pessoa: pessoas,)));
              }, 
              child: Text('Buscar'))
            ],
          ),
        ),
      ),
    );
  }
}