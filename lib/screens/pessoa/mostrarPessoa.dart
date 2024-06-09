
import 'package:adotar_animais_app/data/classPessoa.dart';
import 'package:adotar_animais_app/data/pessoa_dao.dart';
import 'package:adotar_animais_app/screens/pessoa/crudPessoa.dart';
import 'package:adotar_animais_app/screens/pessoa/updatePessoa.dart';
import 'package:flutter/material.dart';

class mostrarPessoa extends StatefulWidget {
  List<PessoaClass>? pessoa;
  mostrarPessoa({super.key, required this.pessoa});

  @override
  State<mostrarPessoa> createState() => _mostrarPessoaState();
}

class _mostrarPessoaState extends State<mostrarPessoa> {
  
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
                        Text('Nome: ' + widget.pessoa![0].nome),
                        ElevatedButton(onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => updatePessoa(pessoa: widget.pessoa,)));
                        }, child: Text('Update')),
                        ElevatedButton(onPressed: (){
                          PessoaDao().delete(widget.pessoa![0].cpf);
                          Navigator.of(context).pop();
                        }, child: Text('Delete'))
                      ],
                    ),
                    Text('CPF: ' + widget.pessoa![0].cpf),
                    Text('Telefone: ' + widget.pessoa![0].telefone),
                    Text('Endereço: ' + widget.pessoa![0].endereco),
                    Text('E-mail: ' + widget.pessoa![0].email),
                  ],
                ),
                
              ),
            ],
          ),
        ),
    );
  }
}